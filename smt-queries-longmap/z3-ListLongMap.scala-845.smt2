; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!20170 () Bool)

(assert start!20170)

(declare-fun b_free!4825 () Bool)

(declare-fun b_next!4825 () Bool)

(assert (=> start!20170 (= b_free!4825 (not b_next!4825))))

(declare-fun tp!17506 () Bool)

(declare-fun b_and!11545 () Bool)

(assert (=> start!20170 (= tp!17506 b_and!11545)))

(declare-fun b!197777 () Bool)

(declare-fun e!130064 () Bool)

(declare-fun e!130065 () Bool)

(declare-fun mapRes!8090 () Bool)

(assert (=> b!197777 (= e!130064 (and e!130065 mapRes!8090))))

(declare-fun condMapEmpty!8090 () Bool)

(declare-datatypes ((V!5889 0))(
  ( (V!5890 (val!2385 Int)) )
))
(declare-datatypes ((ValueCell!1997 0))(
  ( (ValueCellFull!1997 (v!4349 V!5889)) (EmptyCell!1997) )
))
(declare-datatypes ((array!8591 0))(
  ( (array!8592 (arr!4045 (Array (_ BitVec 32) ValueCell!1997)) (size!4371 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!8591)

(declare-fun mapDefault!8090 () ValueCell!1997)

(assert (=> b!197777 (= condMapEmpty!8090 (= (arr!4045 _values!649) ((as const (Array (_ BitVec 32) ValueCell!1997)) mapDefault!8090)))))

(declare-fun mapIsEmpty!8090 () Bool)

(assert (=> mapIsEmpty!8090 mapRes!8090))

(declare-fun res!93635 () Bool)

(declare-fun e!130067 () Bool)

(assert (=> start!20170 (=> (not res!93635) (not e!130067))))

(declare-fun mask!1149 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!20170 (= res!93635 (validMask!0 mask!1149))))

(assert (=> start!20170 e!130067))

(declare-fun array_inv!2635 (array!8591) Bool)

(assert (=> start!20170 (and (array_inv!2635 _values!649) e!130064)))

(assert (=> start!20170 true))

(declare-fun tp_is_empty!4681 () Bool)

(assert (=> start!20170 tp_is_empty!4681))

(declare-datatypes ((array!8593 0))(
  ( (array!8594 (arr!4046 (Array (_ BitVec 32) (_ BitVec 64))) (size!4372 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!8593)

(declare-fun array_inv!2636 (array!8593) Bool)

(assert (=> start!20170 (array_inv!2636 _keys!825)))

(assert (=> start!20170 tp!17506))

(declare-fun b!197778 () Bool)

(assert (=> b!197778 (= e!130067 false)))

(declare-fun v!520 () V!5889)

(declare-fun i!601 () (_ BitVec 32))

(declare-fun zeroValue!615 () V!5889)

(declare-fun defaultEntry!657 () Int)

(declare-fun extraKeys!596 () (_ BitVec 32))

(declare-fun minValue!615 () V!5889)

(declare-datatypes ((tuple2!3586 0))(
  ( (tuple2!3587 (_1!1804 (_ BitVec 64)) (_2!1804 V!5889)) )
))
(declare-datatypes ((List!2519 0))(
  ( (Nil!2516) (Cons!2515 (h!3157 tuple2!3586) (t!7441 List!2519)) )
))
(declare-datatypes ((ListLongMap!2489 0))(
  ( (ListLongMap!2490 (toList!1260 List!2519)) )
))
(declare-fun lt!97633 () ListLongMap!2489)

(declare-fun getCurrentListMapNoExtraKeys!240 (array!8593 array!8591 (_ BitVec 32) (_ BitVec 32) V!5889 V!5889 (_ BitVec 32) Int) ListLongMap!2489)

(assert (=> b!197778 (= lt!97633 (getCurrentListMapNoExtraKeys!240 _keys!825 (array!8592 (store (arr!4045 _values!649) i!601 (ValueCellFull!1997 v!520)) (size!4371 _values!649)) mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!97634 () ListLongMap!2489)

(assert (=> b!197778 (= lt!97634 (getCurrentListMapNoExtraKeys!240 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun b!197779 () Bool)

(assert (=> b!197779 (= e!130065 tp_is_empty!4681)))

(declare-fun b!197780 () Bool)

(declare-fun res!93634 () Bool)

(assert (=> b!197780 (=> (not res!93634) (not e!130067))))

(assert (=> b!197780 (= res!93634 (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!4372 _keys!825))))))

(declare-fun mapNonEmpty!8090 () Bool)

(declare-fun tp!17507 () Bool)

(declare-fun e!130066 () Bool)

(assert (=> mapNonEmpty!8090 (= mapRes!8090 (and tp!17507 e!130066))))

(declare-fun mapKey!8090 () (_ BitVec 32))

(declare-fun mapRest!8090 () (Array (_ BitVec 32) ValueCell!1997))

(declare-fun mapValue!8090 () ValueCell!1997)

(assert (=> mapNonEmpty!8090 (= (arr!4045 _values!649) (store mapRest!8090 mapKey!8090 mapValue!8090))))

(declare-fun b!197781 () Bool)

(declare-fun res!93638 () Bool)

(assert (=> b!197781 (=> (not res!93638) (not e!130067))))

(assert (=> b!197781 (= res!93638 (and (= (size!4371 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!4372 _keys!825) (size!4371 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011)))))

(declare-fun b!197782 () Bool)

(declare-fun res!93633 () Bool)

(assert (=> b!197782 (=> (not res!93633) (not e!130067))))

(declare-fun k0!843 () (_ BitVec 64))

(assert (=> b!197782 (= res!93633 (= (select (arr!4046 _keys!825) i!601) k0!843))))

(declare-fun b!197783 () Bool)

(declare-fun res!93636 () Bool)

(assert (=> b!197783 (=> (not res!93636) (not e!130067))))

(declare-datatypes ((List!2520 0))(
  ( (Nil!2517) (Cons!2516 (h!3158 (_ BitVec 64)) (t!7442 List!2520)) )
))
(declare-fun arrayNoDuplicates!0 (array!8593 (_ BitVec 32) List!2520) Bool)

(assert (=> b!197783 (= res!93636 (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!2517))))

(declare-fun b!197784 () Bool)

(assert (=> b!197784 (= e!130066 tp_is_empty!4681)))

(declare-fun b!197785 () Bool)

(declare-fun res!93637 () Bool)

(assert (=> b!197785 (=> (not res!93637) (not e!130067))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!8593 (_ BitVec 32)) Bool)

(assert (=> b!197785 (= res!93637 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149))))

(declare-fun b!197786 () Bool)

(declare-fun res!93632 () Bool)

(assert (=> b!197786 (=> (not res!93632) (not e!130067))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!197786 (= res!93632 (validKeyInArray!0 k0!843))))

(assert (= (and start!20170 res!93635) b!197781))

(assert (= (and b!197781 res!93638) b!197785))

(assert (= (and b!197785 res!93637) b!197783))

(assert (= (and b!197783 res!93636) b!197780))

(assert (= (and b!197780 res!93634) b!197786))

(assert (= (and b!197786 res!93632) b!197782))

(assert (= (and b!197782 res!93633) b!197778))

(assert (= (and b!197777 condMapEmpty!8090) mapIsEmpty!8090))

(assert (= (and b!197777 (not condMapEmpty!8090)) mapNonEmpty!8090))

(get-info :version)

(assert (= (and mapNonEmpty!8090 ((_ is ValueCellFull!1997) mapValue!8090)) b!197784))

(assert (= (and b!197777 ((_ is ValueCellFull!1997) mapDefault!8090)) b!197779))

(assert (= start!20170 b!197777))

(declare-fun m!224055 () Bool)

(assert (=> b!197786 m!224055))

(declare-fun m!224057 () Bool)

(assert (=> b!197783 m!224057))

(declare-fun m!224059 () Bool)

(assert (=> b!197785 m!224059))

(declare-fun m!224061 () Bool)

(assert (=> start!20170 m!224061))

(declare-fun m!224063 () Bool)

(assert (=> start!20170 m!224063))

(declare-fun m!224065 () Bool)

(assert (=> start!20170 m!224065))

(declare-fun m!224067 () Bool)

(assert (=> b!197778 m!224067))

(declare-fun m!224069 () Bool)

(assert (=> b!197778 m!224069))

(declare-fun m!224071 () Bool)

(assert (=> b!197778 m!224071))

(declare-fun m!224073 () Bool)

(assert (=> mapNonEmpty!8090 m!224073))

(declare-fun m!224075 () Bool)

(assert (=> b!197782 m!224075))

(check-sat (not b!197778) (not b!197783) (not mapNonEmpty!8090) (not b_next!4825) (not b!197786) b_and!11545 tp_is_empty!4681 (not b!197785) (not start!20170))
(check-sat b_and!11545 (not b_next!4825))
