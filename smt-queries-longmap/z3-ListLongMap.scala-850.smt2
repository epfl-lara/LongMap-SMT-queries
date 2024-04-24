; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!20200 () Bool)

(assert start!20200)

(declare-fun b_free!4855 () Bool)

(declare-fun b_next!4855 () Bool)

(assert (=> start!20200 (= b_free!4855 (not b_next!4855))))

(declare-fun tp!17597 () Bool)

(declare-fun b_and!11615 () Bool)

(assert (=> start!20200 (= tp!17597 b_and!11615)))

(declare-fun mapIsEmpty!8135 () Bool)

(declare-fun mapRes!8135 () Bool)

(assert (=> mapIsEmpty!8135 mapRes!8135))

(declare-fun b!198421 () Bool)

(declare-fun res!94067 () Bool)

(declare-fun e!130417 () Bool)

(assert (=> b!198421 (=> (not res!94067) (not e!130417))))

(declare-datatypes ((array!8659 0))(
  ( (array!8660 (arr!4080 (Array (_ BitVec 32) (_ BitVec 64))) (size!4405 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!8659)

(declare-fun k0!843 () (_ BitVec 64))

(declare-fun i!601 () (_ BitVec 32))

(assert (=> b!198421 (= res!94067 (= (select (arr!4080 _keys!825) i!601) k0!843))))

(declare-fun b!198422 () Bool)

(declare-fun res!94064 () Bool)

(assert (=> b!198422 (=> (not res!94064) (not e!130417))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!198422 (= res!94064 (validKeyInArray!0 k0!843))))

(declare-fun b!198423 () Bool)

(declare-fun res!94066 () Bool)

(assert (=> b!198423 (=> (not res!94066) (not e!130417))))

(assert (=> b!198423 (= res!94066 (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!4405 _keys!825))))))

(declare-fun res!94069 () Bool)

(assert (=> start!20200 (=> (not res!94069) (not e!130417))))

(declare-fun mask!1149 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!20200 (= res!94069 (validMask!0 mask!1149))))

(assert (=> start!20200 e!130417))

(declare-datatypes ((V!5929 0))(
  ( (V!5930 (val!2400 Int)) )
))
(declare-datatypes ((ValueCell!2012 0))(
  ( (ValueCellFull!2012 (v!4371 V!5929)) (EmptyCell!2012) )
))
(declare-datatypes ((array!8661 0))(
  ( (array!8662 (arr!4081 (Array (_ BitVec 32) ValueCell!2012)) (size!4406 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!8661)

(declare-fun e!130418 () Bool)

(declare-fun array_inv!2659 (array!8661) Bool)

(assert (=> start!20200 (and (array_inv!2659 _values!649) e!130418)))

(assert (=> start!20200 true))

(declare-fun tp_is_empty!4711 () Bool)

(assert (=> start!20200 tp_is_empty!4711))

(declare-fun array_inv!2660 (array!8659) Bool)

(assert (=> start!20200 (array_inv!2660 _keys!825)))

(assert (=> start!20200 tp!17597))

(declare-fun mapNonEmpty!8135 () Bool)

(declare-fun tp!17596 () Bool)

(declare-fun e!130415 () Bool)

(assert (=> mapNonEmpty!8135 (= mapRes!8135 (and tp!17596 e!130415))))

(declare-fun mapKey!8135 () (_ BitVec 32))

(declare-fun mapRest!8135 () (Array (_ BitVec 32) ValueCell!2012))

(declare-fun mapValue!8135 () ValueCell!2012)

(assert (=> mapNonEmpty!8135 (= (arr!4081 _values!649) (store mapRest!8135 mapKey!8135 mapValue!8135))))

(declare-fun b!198424 () Bool)

(declare-fun e!130414 () Bool)

(assert (=> b!198424 (= e!130414 tp_is_empty!4711)))

(declare-fun b!198425 () Bool)

(assert (=> b!198425 (= e!130417 false)))

(declare-fun v!520 () V!5929)

(declare-fun zeroValue!615 () V!5929)

(declare-datatypes ((tuple2!3584 0))(
  ( (tuple2!3585 (_1!1803 (_ BitVec 64)) (_2!1803 V!5929)) )
))
(declare-datatypes ((List!2504 0))(
  ( (Nil!2501) (Cons!2500 (h!3142 tuple2!3584) (t!7427 List!2504)) )
))
(declare-datatypes ((ListLongMap!2499 0))(
  ( (ListLongMap!2500 (toList!1265 List!2504)) )
))
(declare-fun lt!97964 () ListLongMap!2499)

(declare-fun defaultEntry!657 () Int)

(declare-fun extraKeys!596 () (_ BitVec 32))

(declare-fun minValue!615 () V!5929)

(declare-fun getCurrentListMapNoExtraKeys!255 (array!8659 array!8661 (_ BitVec 32) (_ BitVec 32) V!5929 V!5929 (_ BitVec 32) Int) ListLongMap!2499)

(assert (=> b!198425 (= lt!97964 (getCurrentListMapNoExtraKeys!255 _keys!825 (array!8662 (store (arr!4081 _values!649) i!601 (ValueCellFull!2012 v!520)) (size!4406 _values!649)) mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!97963 () ListLongMap!2499)

(assert (=> b!198425 (= lt!97963 (getCurrentListMapNoExtraKeys!255 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun b!198426 () Bool)

(assert (=> b!198426 (= e!130415 tp_is_empty!4711)))

(declare-fun b!198427 () Bool)

(declare-fun res!94068 () Bool)

(assert (=> b!198427 (=> (not res!94068) (not e!130417))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!8659 (_ BitVec 32)) Bool)

(assert (=> b!198427 (= res!94068 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149))))

(declare-fun b!198428 () Bool)

(declare-fun res!94063 () Bool)

(assert (=> b!198428 (=> (not res!94063) (not e!130417))))

(assert (=> b!198428 (= res!94063 (and (= (size!4406 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!4405 _keys!825) (size!4406 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011)))))

(declare-fun b!198429 () Bool)

(assert (=> b!198429 (= e!130418 (and e!130414 mapRes!8135))))

(declare-fun condMapEmpty!8135 () Bool)

(declare-fun mapDefault!8135 () ValueCell!2012)

(assert (=> b!198429 (= condMapEmpty!8135 (= (arr!4081 _values!649) ((as const (Array (_ BitVec 32) ValueCell!2012)) mapDefault!8135)))))

(declare-fun b!198430 () Bool)

(declare-fun res!94065 () Bool)

(assert (=> b!198430 (=> (not res!94065) (not e!130417))))

(declare-datatypes ((List!2505 0))(
  ( (Nil!2502) (Cons!2501 (h!3143 (_ BitVec 64)) (t!7428 List!2505)) )
))
(declare-fun arrayNoDuplicates!0 (array!8659 (_ BitVec 32) List!2505) Bool)

(assert (=> b!198430 (= res!94065 (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!2502))))

(assert (= (and start!20200 res!94069) b!198428))

(assert (= (and b!198428 res!94063) b!198427))

(assert (= (and b!198427 res!94068) b!198430))

(assert (= (and b!198430 res!94065) b!198423))

(assert (= (and b!198423 res!94066) b!198422))

(assert (= (and b!198422 res!94064) b!198421))

(assert (= (and b!198421 res!94067) b!198425))

(assert (= (and b!198429 condMapEmpty!8135) mapIsEmpty!8135))

(assert (= (and b!198429 (not condMapEmpty!8135)) mapNonEmpty!8135))

(get-info :version)

(assert (= (and mapNonEmpty!8135 ((_ is ValueCellFull!2012) mapValue!8135)) b!198426))

(assert (= (and b!198429 ((_ is ValueCellFull!2012) mapDefault!8135)) b!198424))

(assert (= start!20200 b!198429))

(declare-fun m!225183 () Bool)

(assert (=> b!198427 m!225183))

(declare-fun m!225185 () Bool)

(assert (=> b!198422 m!225185))

(declare-fun m!225187 () Bool)

(assert (=> mapNonEmpty!8135 m!225187))

(declare-fun m!225189 () Bool)

(assert (=> b!198425 m!225189))

(declare-fun m!225191 () Bool)

(assert (=> b!198425 m!225191))

(declare-fun m!225193 () Bool)

(assert (=> b!198425 m!225193))

(declare-fun m!225195 () Bool)

(assert (=> start!20200 m!225195))

(declare-fun m!225197 () Bool)

(assert (=> start!20200 m!225197))

(declare-fun m!225199 () Bool)

(assert (=> start!20200 m!225199))

(declare-fun m!225201 () Bool)

(assert (=> b!198421 m!225201))

(declare-fun m!225203 () Bool)

(assert (=> b!198430 m!225203))

(check-sat (not start!20200) b_and!11615 tp_is_empty!4711 (not mapNonEmpty!8135) (not b!198422) (not b!198427) (not b_next!4855) (not b!198430) (not b!198425))
(check-sat b_and!11615 (not b_next!4855))
