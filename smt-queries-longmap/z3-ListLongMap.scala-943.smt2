; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!20758 () Bool)

(assert start!20758)

(declare-fun b_free!5413 () Bool)

(declare-fun b_next!5413 () Bool)

(assert (=> start!20758 (= b_free!5413 (not b_next!5413))))

(declare-fun tp!19270 () Bool)

(declare-fun b_and!12133 () Bool)

(assert (=> start!20758 (= tp!19270 b_and!12133)))

(declare-fun mapIsEmpty!8972 () Bool)

(declare-fun mapRes!8972 () Bool)

(assert (=> mapIsEmpty!8972 mapRes!8972))

(declare-fun b!207659 () Bool)

(declare-fun res!100868 () Bool)

(declare-fun e!135509 () Bool)

(assert (=> b!207659 (=> (not res!100868) (not e!135509))))

(declare-fun k0!843 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!207659 (= res!100868 (validKeyInArray!0 k0!843))))

(declare-fun mapNonEmpty!8972 () Bool)

(declare-fun tp!19271 () Bool)

(declare-fun e!135512 () Bool)

(assert (=> mapNonEmpty!8972 (= mapRes!8972 (and tp!19271 e!135512))))

(declare-datatypes ((V!6673 0))(
  ( (V!6674 (val!2679 Int)) )
))
(declare-datatypes ((ValueCell!2291 0))(
  ( (ValueCellFull!2291 (v!4643 V!6673)) (EmptyCell!2291) )
))
(declare-fun mapValue!8972 () ValueCell!2291)

(declare-fun mapRest!8972 () (Array (_ BitVec 32) ValueCell!2291))

(declare-datatypes ((array!9731 0))(
  ( (array!9732 (arr!4615 (Array (_ BitVec 32) ValueCell!2291)) (size!4941 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!9731)

(declare-fun mapKey!8972 () (_ BitVec 32))

(assert (=> mapNonEmpty!8972 (= (arr!4615 _values!649) (store mapRest!8972 mapKey!8972 mapValue!8972))))

(declare-fun b!207660 () Bool)

(declare-fun res!100869 () Bool)

(assert (=> b!207660 (=> (not res!100869) (not e!135509))))

(declare-fun i!601 () (_ BitVec 32))

(declare-datatypes ((array!9733 0))(
  ( (array!9734 (arr!4616 (Array (_ BitVec 32) (_ BitVec 64))) (size!4942 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!9733)

(assert (=> b!207660 (= res!100869 (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!4942 _keys!825))))))

(declare-fun b!207661 () Bool)

(assert (=> b!207661 (= e!135509 (not true))))

(declare-fun mask!1149 () (_ BitVec 32))

(declare-datatypes ((tuple2!4046 0))(
  ( (tuple2!4047 (_1!2034 (_ BitVec 64)) (_2!2034 V!6673)) )
))
(declare-datatypes ((List!2949 0))(
  ( (Nil!2946) (Cons!2945 (h!3587 tuple2!4046) (t!7871 List!2949)) )
))
(declare-datatypes ((ListLongMap!2949 0))(
  ( (ListLongMap!2950 (toList!1490 List!2949)) )
))
(declare-fun lt!106356 () ListLongMap!2949)

(declare-fun zeroValue!615 () V!6673)

(declare-fun defaultEntry!657 () Int)

(declare-fun extraKeys!596 () (_ BitVec 32))

(declare-fun minValue!615 () V!6673)

(declare-fun getCurrentListMap!1031 (array!9733 array!9731 (_ BitVec 32) (_ BitVec 32) V!6673 V!6673 (_ BitVec 32) Int) ListLongMap!2949)

(assert (=> b!207661 (= lt!106356 (getCurrentListMap!1031 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!106361 () array!9731)

(declare-fun lt!106360 () ListLongMap!2949)

(assert (=> b!207661 (= lt!106360 (getCurrentListMap!1031 _keys!825 lt!106361 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!106359 () ListLongMap!2949)

(declare-fun lt!106358 () ListLongMap!2949)

(assert (=> b!207661 (and (= lt!106359 lt!106358) (= lt!106358 lt!106359))))

(declare-fun lt!106355 () ListLongMap!2949)

(declare-fun v!520 () V!6673)

(declare-fun +!539 (ListLongMap!2949 tuple2!4046) ListLongMap!2949)

(assert (=> b!207661 (= lt!106358 (+!539 lt!106355 (tuple2!4047 k0!843 v!520)))))

(declare-datatypes ((Unit!6318 0))(
  ( (Unit!6319) )
))
(declare-fun lt!106357 () Unit!6318)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!190 (array!9733 array!9731 (_ BitVec 32) (_ BitVec 32) V!6673 V!6673 (_ BitVec 32) (_ BitVec 64) V!6673 (_ BitVec 32) Int) Unit!6318)

(assert (=> b!207661 (= lt!106357 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!190 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 i!601 k0!843 v!520 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun getCurrentListMapNoExtraKeys!441 (array!9733 array!9731 (_ BitVec 32) (_ BitVec 32) V!6673 V!6673 (_ BitVec 32) Int) ListLongMap!2949)

(assert (=> b!207661 (= lt!106359 (getCurrentListMapNoExtraKeys!441 _keys!825 lt!106361 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (=> b!207661 (= lt!106361 (array!9732 (store (arr!4615 _values!649) i!601 (ValueCellFull!2291 v!520)) (size!4941 _values!649)))))

(assert (=> b!207661 (= lt!106355 (getCurrentListMapNoExtraKeys!441 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun b!207662 () Bool)

(declare-fun e!135513 () Bool)

(declare-fun tp_is_empty!5269 () Bool)

(assert (=> b!207662 (= e!135513 tp_is_empty!5269)))

(declare-fun b!207663 () Bool)

(declare-fun res!100870 () Bool)

(assert (=> b!207663 (=> (not res!100870) (not e!135509))))

(declare-datatypes ((List!2950 0))(
  ( (Nil!2947) (Cons!2946 (h!3588 (_ BitVec 64)) (t!7872 List!2950)) )
))
(declare-fun arrayNoDuplicates!0 (array!9733 (_ BitVec 32) List!2950) Bool)

(assert (=> b!207663 (= res!100870 (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!2947))))

(declare-fun b!207664 () Bool)

(declare-fun res!100872 () Bool)

(assert (=> b!207664 (=> (not res!100872) (not e!135509))))

(assert (=> b!207664 (= res!100872 (= (select (arr!4616 _keys!825) i!601) k0!843))))

(declare-fun b!207665 () Bool)

(declare-fun e!135510 () Bool)

(assert (=> b!207665 (= e!135510 (and e!135513 mapRes!8972))))

(declare-fun condMapEmpty!8972 () Bool)

(declare-fun mapDefault!8972 () ValueCell!2291)

(assert (=> b!207665 (= condMapEmpty!8972 (= (arr!4615 _values!649) ((as const (Array (_ BitVec 32) ValueCell!2291)) mapDefault!8972)))))

(declare-fun b!207666 () Bool)

(assert (=> b!207666 (= e!135512 tp_is_empty!5269)))

(declare-fun res!100871 () Bool)

(assert (=> start!20758 (=> (not res!100871) (not e!135509))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!20758 (= res!100871 (validMask!0 mask!1149))))

(assert (=> start!20758 e!135509))

(declare-fun array_inv!3033 (array!9731) Bool)

(assert (=> start!20758 (and (array_inv!3033 _values!649) e!135510)))

(assert (=> start!20758 true))

(assert (=> start!20758 tp_is_empty!5269))

(declare-fun array_inv!3034 (array!9733) Bool)

(assert (=> start!20758 (array_inv!3034 _keys!825)))

(assert (=> start!20758 tp!19270))

(declare-fun b!207667 () Bool)

(declare-fun res!100874 () Bool)

(assert (=> b!207667 (=> (not res!100874) (not e!135509))))

(assert (=> b!207667 (= res!100874 (and (= (size!4941 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!4942 _keys!825) (size!4941 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011)))))

(declare-fun b!207668 () Bool)

(declare-fun res!100873 () Bool)

(assert (=> b!207668 (=> (not res!100873) (not e!135509))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!9733 (_ BitVec 32)) Bool)

(assert (=> b!207668 (= res!100873 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149))))

(assert (= (and start!20758 res!100871) b!207667))

(assert (= (and b!207667 res!100874) b!207668))

(assert (= (and b!207668 res!100873) b!207663))

(assert (= (and b!207663 res!100870) b!207660))

(assert (= (and b!207660 res!100869) b!207659))

(assert (= (and b!207659 res!100868) b!207664))

(assert (= (and b!207664 res!100872) b!207661))

(assert (= (and b!207665 condMapEmpty!8972) mapIsEmpty!8972))

(assert (= (and b!207665 (not condMapEmpty!8972)) mapNonEmpty!8972))

(get-info :version)

(assert (= (and mapNonEmpty!8972 ((_ is ValueCellFull!2291) mapValue!8972)) b!207666))

(assert (= (and b!207665 ((_ is ValueCellFull!2291) mapDefault!8972)) b!207662))

(assert (= start!20758 b!207665))

(declare-fun m!234933 () Bool)

(assert (=> start!20758 m!234933))

(declare-fun m!234935 () Bool)

(assert (=> start!20758 m!234935))

(declare-fun m!234937 () Bool)

(assert (=> start!20758 m!234937))

(declare-fun m!234939 () Bool)

(assert (=> mapNonEmpty!8972 m!234939))

(declare-fun m!234941 () Bool)

(assert (=> b!207664 m!234941))

(declare-fun m!234943 () Bool)

(assert (=> b!207661 m!234943))

(declare-fun m!234945 () Bool)

(assert (=> b!207661 m!234945))

(declare-fun m!234947 () Bool)

(assert (=> b!207661 m!234947))

(declare-fun m!234949 () Bool)

(assert (=> b!207661 m!234949))

(declare-fun m!234951 () Bool)

(assert (=> b!207661 m!234951))

(declare-fun m!234953 () Bool)

(assert (=> b!207661 m!234953))

(declare-fun m!234955 () Bool)

(assert (=> b!207661 m!234955))

(declare-fun m!234957 () Bool)

(assert (=> b!207663 m!234957))

(declare-fun m!234959 () Bool)

(assert (=> b!207659 m!234959))

(declare-fun m!234961 () Bool)

(assert (=> b!207668 m!234961))

(check-sat (not b!207659) (not start!20758) (not b!207661) (not b!207663) b_and!12133 (not b!207668) (not b_next!5413) tp_is_empty!5269 (not mapNonEmpty!8972))
(check-sat b_and!12133 (not b_next!5413))
