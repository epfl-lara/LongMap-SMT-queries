; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!20678 () Bool)

(assert start!20678)

(declare-fun b_free!5337 () Bool)

(declare-fun b_next!5337 () Bool)

(assert (=> start!20678 (= b_free!5337 (not b_next!5337))))

(declare-fun tp!19043 () Bool)

(declare-fun b_and!12083 () Bool)

(assert (=> start!20678 (= tp!19043 b_and!12083)))

(declare-fun b!206666 () Bool)

(declare-fun res!100171 () Bool)

(declare-fun e!135040 () Bool)

(assert (=> b!206666 (=> (not res!100171) (not e!135040))))

(declare-datatypes ((array!9597 0))(
  ( (array!9598 (arr!4549 (Array (_ BitVec 32) (_ BitVec 64))) (size!4874 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!9597)

(declare-fun mask!1149 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!9597 (_ BitVec 32)) Bool)

(assert (=> b!206666 (= res!100171 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149))))

(declare-fun mapIsEmpty!8858 () Bool)

(declare-fun mapRes!8858 () Bool)

(assert (=> mapIsEmpty!8858 mapRes!8858))

(declare-fun b!206668 () Bool)

(declare-fun e!135044 () Bool)

(declare-fun e!135043 () Bool)

(assert (=> b!206668 (= e!135044 (and e!135043 mapRes!8858))))

(declare-fun condMapEmpty!8858 () Bool)

(declare-datatypes ((V!6571 0))(
  ( (V!6572 (val!2641 Int)) )
))
(declare-datatypes ((ValueCell!2253 0))(
  ( (ValueCellFull!2253 (v!4611 V!6571)) (EmptyCell!2253) )
))
(declare-datatypes ((array!9599 0))(
  ( (array!9600 (arr!4550 (Array (_ BitVec 32) ValueCell!2253)) (size!4875 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!9599)

(declare-fun mapDefault!8858 () ValueCell!2253)

(assert (=> b!206668 (= condMapEmpty!8858 (= (arr!4550 _values!649) ((as const (Array (_ BitVec 32) ValueCell!2253)) mapDefault!8858)))))

(declare-fun b!206669 () Bool)

(declare-fun res!100166 () Bool)

(assert (=> b!206669 (=> (not res!100166) (not e!135040))))

(declare-fun k0!843 () (_ BitVec 64))

(declare-fun i!601 () (_ BitVec 32))

(assert (=> b!206669 (= res!100166 (= (select (arr!4549 _keys!825) i!601) k0!843))))

(declare-fun b!206670 () Bool)

(assert (=> b!206670 (= e!135040 (not true))))

(declare-datatypes ((tuple2!4010 0))(
  ( (tuple2!4011 (_1!2016 (_ BitVec 64)) (_2!2016 V!6571)) )
))
(declare-datatypes ((List!2902 0))(
  ( (Nil!2899) (Cons!2898 (h!3540 tuple2!4010) (t!7833 List!2902)) )
))
(declare-datatypes ((ListLongMap!2923 0))(
  ( (ListLongMap!2924 (toList!1477 List!2902)) )
))
(declare-fun lt!105729 () ListLongMap!2923)

(declare-fun zeroValue!615 () V!6571)

(declare-fun defaultEntry!657 () Int)

(declare-fun extraKeys!596 () (_ BitVec 32))

(declare-fun minValue!615 () V!6571)

(declare-fun getCurrentListMap!1044 (array!9597 array!9599 (_ BitVec 32) (_ BitVec 32) V!6571 V!6571 (_ BitVec 32) Int) ListLongMap!2923)

(assert (=> b!206670 (= lt!105729 (getCurrentListMap!1044 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!105730 () ListLongMap!2923)

(declare-fun lt!105732 () array!9599)

(assert (=> b!206670 (= lt!105730 (getCurrentListMap!1044 _keys!825 lt!105732 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!105733 () ListLongMap!2923)

(declare-fun lt!105734 () ListLongMap!2923)

(assert (=> b!206670 (and (= lt!105733 lt!105734) (= lt!105734 lt!105733))))

(declare-fun lt!105731 () ListLongMap!2923)

(declare-fun v!520 () V!6571)

(declare-fun +!504 (ListLongMap!2923 tuple2!4010) ListLongMap!2923)

(assert (=> b!206670 (= lt!105734 (+!504 lt!105731 (tuple2!4011 k0!843 v!520)))))

(declare-datatypes ((Unit!6296 0))(
  ( (Unit!6297) )
))
(declare-fun lt!105735 () Unit!6296)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!157 (array!9597 array!9599 (_ BitVec 32) (_ BitVec 32) V!6571 V!6571 (_ BitVec 32) (_ BitVec 64) V!6571 (_ BitVec 32) Int) Unit!6296)

(assert (=> b!206670 (= lt!105735 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!157 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 i!601 k0!843 v!520 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun getCurrentListMapNoExtraKeys!418 (array!9597 array!9599 (_ BitVec 32) (_ BitVec 32) V!6571 V!6571 (_ BitVec 32) Int) ListLongMap!2923)

(assert (=> b!206670 (= lt!105733 (getCurrentListMapNoExtraKeys!418 _keys!825 lt!105732 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (=> b!206670 (= lt!105732 (array!9600 (store (arr!4550 _values!649) i!601 (ValueCellFull!2253 v!520)) (size!4875 _values!649)))))

(assert (=> b!206670 (= lt!105731 (getCurrentListMapNoExtraKeys!418 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun b!206671 () Bool)

(declare-fun e!135042 () Bool)

(declare-fun tp_is_empty!5193 () Bool)

(assert (=> b!206671 (= e!135042 tp_is_empty!5193)))

(declare-fun b!206672 () Bool)

(declare-fun res!100168 () Bool)

(assert (=> b!206672 (=> (not res!100168) (not e!135040))))

(assert (=> b!206672 (= res!100168 (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!4874 _keys!825))))))

(declare-fun res!100167 () Bool)

(assert (=> start!20678 (=> (not res!100167) (not e!135040))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!20678 (= res!100167 (validMask!0 mask!1149))))

(assert (=> start!20678 e!135040))

(declare-fun array_inv!3009 (array!9599) Bool)

(assert (=> start!20678 (and (array_inv!3009 _values!649) e!135044)))

(assert (=> start!20678 true))

(assert (=> start!20678 tp_is_empty!5193))

(declare-fun array_inv!3010 (array!9597) Bool)

(assert (=> start!20678 (array_inv!3010 _keys!825)))

(assert (=> start!20678 tp!19043))

(declare-fun b!206667 () Bool)

(declare-fun res!100165 () Bool)

(assert (=> b!206667 (=> (not res!100165) (not e!135040))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!206667 (= res!100165 (validKeyInArray!0 k0!843))))

(declare-fun b!206673 () Bool)

(assert (=> b!206673 (= e!135043 tp_is_empty!5193)))

(declare-fun b!206674 () Bool)

(declare-fun res!100170 () Bool)

(assert (=> b!206674 (=> (not res!100170) (not e!135040))))

(assert (=> b!206674 (= res!100170 (and (= (size!4875 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!4874 _keys!825) (size!4875 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011)))))

(declare-fun b!206675 () Bool)

(declare-fun res!100169 () Bool)

(assert (=> b!206675 (=> (not res!100169) (not e!135040))))

(declare-datatypes ((List!2903 0))(
  ( (Nil!2900) (Cons!2899 (h!3541 (_ BitVec 64)) (t!7834 List!2903)) )
))
(declare-fun arrayNoDuplicates!0 (array!9597 (_ BitVec 32) List!2903) Bool)

(assert (=> b!206675 (= res!100169 (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!2900))))

(declare-fun mapNonEmpty!8858 () Bool)

(declare-fun tp!19042 () Bool)

(assert (=> mapNonEmpty!8858 (= mapRes!8858 (and tp!19042 e!135042))))

(declare-fun mapValue!8858 () ValueCell!2253)

(declare-fun mapKey!8858 () (_ BitVec 32))

(declare-fun mapRest!8858 () (Array (_ BitVec 32) ValueCell!2253))

(assert (=> mapNonEmpty!8858 (= (arr!4550 _values!649) (store mapRest!8858 mapKey!8858 mapValue!8858))))

(assert (= (and start!20678 res!100167) b!206674))

(assert (= (and b!206674 res!100170) b!206666))

(assert (= (and b!206666 res!100171) b!206675))

(assert (= (and b!206675 res!100169) b!206672))

(assert (= (and b!206672 res!100168) b!206667))

(assert (= (and b!206667 res!100165) b!206669))

(assert (= (and b!206669 res!100166) b!206670))

(assert (= (and b!206668 condMapEmpty!8858) mapIsEmpty!8858))

(assert (= (and b!206668 (not condMapEmpty!8858)) mapNonEmpty!8858))

(get-info :version)

(assert (= (and mapNonEmpty!8858 ((_ is ValueCellFull!2253) mapValue!8858)) b!206671))

(assert (= (and b!206668 ((_ is ValueCellFull!2253) mapDefault!8858)) b!206673))

(assert (= start!20678 b!206668))

(declare-fun m!234409 () Bool)

(assert (=> b!206667 m!234409))

(declare-fun m!234411 () Bool)

(assert (=> mapNonEmpty!8858 m!234411))

(declare-fun m!234413 () Bool)

(assert (=> start!20678 m!234413))

(declare-fun m!234415 () Bool)

(assert (=> start!20678 m!234415))

(declare-fun m!234417 () Bool)

(assert (=> start!20678 m!234417))

(declare-fun m!234419 () Bool)

(assert (=> b!206666 m!234419))

(declare-fun m!234421 () Bool)

(assert (=> b!206669 m!234421))

(declare-fun m!234423 () Bool)

(assert (=> b!206675 m!234423))

(declare-fun m!234425 () Bool)

(assert (=> b!206670 m!234425))

(declare-fun m!234427 () Bool)

(assert (=> b!206670 m!234427))

(declare-fun m!234429 () Bool)

(assert (=> b!206670 m!234429))

(declare-fun m!234431 () Bool)

(assert (=> b!206670 m!234431))

(declare-fun m!234433 () Bool)

(assert (=> b!206670 m!234433))

(declare-fun m!234435 () Bool)

(assert (=> b!206670 m!234435))

(declare-fun m!234437 () Bool)

(assert (=> b!206670 m!234437))

(check-sat (not b_next!5337) b_and!12083 (not b!206670) (not mapNonEmpty!8858) (not b!206666) (not b!206675) (not b!206667) tp_is_empty!5193 (not start!20678))
(check-sat b_and!12083 (not b_next!5337))
