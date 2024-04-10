; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!20288 () Bool)

(assert start!20288)

(declare-fun b_free!4947 () Bool)

(declare-fun b_next!4947 () Bool)

(assert (=> start!20288 (= b_free!4947 (not b_next!4947))))

(declare-fun tp!17873 () Bool)

(declare-fun b_and!11693 () Bool)

(assert (=> start!20288 (= tp!17873 b_and!11693)))

(declare-fun b!199754 () Bool)

(declare-fun e!131084 () Bool)

(declare-fun tp_is_empty!4803 () Bool)

(assert (=> b!199754 (= e!131084 tp_is_empty!4803)))

(declare-fun b!199755 () Bool)

(declare-fun res!95008 () Bool)

(declare-fun e!131080 () Bool)

(assert (=> b!199755 (=> (not res!95008) (not e!131080))))

(declare-datatypes ((array!8845 0))(
  ( (array!8846 (arr!4173 (Array (_ BitVec 32) (_ BitVec 64))) (size!4498 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!8845)

(declare-fun k0!843 () (_ BitVec 64))

(declare-fun i!601 () (_ BitVec 32))

(assert (=> b!199755 (= res!95008 (= (select (arr!4173 _keys!825) i!601) k0!843))))

(declare-fun b!199756 () Bool)

(declare-fun res!95014 () Bool)

(assert (=> b!199756 (=> (not res!95014) (not e!131080))))

(assert (=> b!199756 (= res!95014 (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!4498 _keys!825))))))

(declare-fun b!199757 () Bool)

(assert (=> b!199757 (= e!131080 (not true))))

(declare-fun mask!1149 () (_ BitVec 32))

(declare-datatypes ((V!6051 0))(
  ( (V!6052 (val!2446 Int)) )
))
(declare-datatypes ((tuple2!3698 0))(
  ( (tuple2!3699 (_1!1860 (_ BitVec 64)) (_2!1860 V!6051)) )
))
(declare-datatypes ((List!2615 0))(
  ( (Nil!2612) (Cons!2611 (h!3253 tuple2!3698) (t!7546 List!2615)) )
))
(declare-datatypes ((ListLongMap!2611 0))(
  ( (ListLongMap!2612 (toList!1321 List!2615)) )
))
(declare-fun lt!98509 () ListLongMap!2611)

(declare-fun zeroValue!615 () V!6051)

(declare-datatypes ((ValueCell!2058 0))(
  ( (ValueCellFull!2058 (v!4416 V!6051)) (EmptyCell!2058) )
))
(declare-datatypes ((array!8847 0))(
  ( (array!8848 (arr!4174 (Array (_ BitVec 32) ValueCell!2058)) (size!4499 (_ BitVec 32))) )
))
(declare-fun lt!98510 () array!8847)

(declare-fun defaultEntry!657 () Int)

(declare-fun extraKeys!596 () (_ BitVec 32))

(declare-fun minValue!615 () V!6051)

(declare-fun getCurrentListMap!912 (array!8845 array!8847 (_ BitVec 32) (_ BitVec 32) V!6051 V!6051 (_ BitVec 32) Int) ListLongMap!2611)

(assert (=> b!199757 (= lt!98509 (getCurrentListMap!912 _keys!825 lt!98510 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!98508 () ListLongMap!2611)

(declare-fun lt!98511 () ListLongMap!2611)

(assert (=> b!199757 (and (= lt!98508 lt!98511) (= lt!98511 lt!98508))))

(declare-fun lt!98507 () ListLongMap!2611)

(declare-fun v!520 () V!6051)

(declare-fun +!348 (ListLongMap!2611 tuple2!3698) ListLongMap!2611)

(assert (=> b!199757 (= lt!98511 (+!348 lt!98507 (tuple2!3699 k0!843 v!520)))))

(declare-datatypes ((Unit!5998 0))(
  ( (Unit!5999) )
))
(declare-fun lt!98506 () Unit!5998)

(declare-fun _values!649 () array!8847)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!25 (array!8845 array!8847 (_ BitVec 32) (_ BitVec 32) V!6051 V!6051 (_ BitVec 32) (_ BitVec 64) V!6051 (_ BitVec 32) Int) Unit!5998)

(assert (=> b!199757 (= lt!98506 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!25 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 i!601 k0!843 v!520 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun getCurrentListMapNoExtraKeys!286 (array!8845 array!8847 (_ BitVec 32) (_ BitVec 32) V!6051 V!6051 (_ BitVec 32) Int) ListLongMap!2611)

(assert (=> b!199757 (= lt!98508 (getCurrentListMapNoExtraKeys!286 _keys!825 lt!98510 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (=> b!199757 (= lt!98510 (array!8848 (store (arr!4174 _values!649) i!601 (ValueCellFull!2058 v!520)) (size!4499 _values!649)))))

(assert (=> b!199757 (= lt!98507 (getCurrentListMapNoExtraKeys!286 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun b!199758 () Bool)

(declare-fun e!131083 () Bool)

(assert (=> b!199758 (= e!131083 tp_is_empty!4803)))

(declare-fun b!199759 () Bool)

(declare-fun res!95011 () Bool)

(assert (=> b!199759 (=> (not res!95011) (not e!131080))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!8845 (_ BitVec 32)) Bool)

(assert (=> b!199759 (= res!95011 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149))))

(declare-fun mapNonEmpty!8273 () Bool)

(declare-fun mapRes!8273 () Bool)

(declare-fun tp!17872 () Bool)

(assert (=> mapNonEmpty!8273 (= mapRes!8273 (and tp!17872 e!131083))))

(declare-fun mapValue!8273 () ValueCell!2058)

(declare-fun mapRest!8273 () (Array (_ BitVec 32) ValueCell!2058))

(declare-fun mapKey!8273 () (_ BitVec 32))

(assert (=> mapNonEmpty!8273 (= (arr!4174 _values!649) (store mapRest!8273 mapKey!8273 mapValue!8273))))

(declare-fun res!95009 () Bool)

(assert (=> start!20288 (=> (not res!95009) (not e!131080))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!20288 (= res!95009 (validMask!0 mask!1149))))

(assert (=> start!20288 e!131080))

(declare-fun e!131081 () Bool)

(declare-fun array_inv!2743 (array!8847) Bool)

(assert (=> start!20288 (and (array_inv!2743 _values!649) e!131081)))

(assert (=> start!20288 true))

(assert (=> start!20288 tp_is_empty!4803))

(declare-fun array_inv!2744 (array!8845) Bool)

(assert (=> start!20288 (array_inv!2744 _keys!825)))

(assert (=> start!20288 tp!17873))

(declare-fun b!199760 () Bool)

(declare-fun res!95013 () Bool)

(assert (=> b!199760 (=> (not res!95013) (not e!131080))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!199760 (= res!95013 (validKeyInArray!0 k0!843))))

(declare-fun b!199761 () Bool)

(assert (=> b!199761 (= e!131081 (and e!131084 mapRes!8273))))

(declare-fun condMapEmpty!8273 () Bool)

(declare-fun mapDefault!8273 () ValueCell!2058)

(assert (=> b!199761 (= condMapEmpty!8273 (= (arr!4174 _values!649) ((as const (Array (_ BitVec 32) ValueCell!2058)) mapDefault!8273)))))

(declare-fun b!199762 () Bool)

(declare-fun res!95012 () Bool)

(assert (=> b!199762 (=> (not res!95012) (not e!131080))))

(declare-datatypes ((List!2616 0))(
  ( (Nil!2613) (Cons!2612 (h!3254 (_ BitVec 64)) (t!7547 List!2616)) )
))
(declare-fun arrayNoDuplicates!0 (array!8845 (_ BitVec 32) List!2616) Bool)

(assert (=> b!199762 (= res!95012 (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!2613))))

(declare-fun b!199763 () Bool)

(declare-fun res!95010 () Bool)

(assert (=> b!199763 (=> (not res!95010) (not e!131080))))

(assert (=> b!199763 (= res!95010 (and (= (size!4499 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!4498 _keys!825) (size!4499 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!8273 () Bool)

(assert (=> mapIsEmpty!8273 mapRes!8273))

(assert (= (and start!20288 res!95009) b!199763))

(assert (= (and b!199763 res!95010) b!199759))

(assert (= (and b!199759 res!95011) b!199762))

(assert (= (and b!199762 res!95012) b!199756))

(assert (= (and b!199756 res!95014) b!199760))

(assert (= (and b!199760 res!95013) b!199755))

(assert (= (and b!199755 res!95008) b!199757))

(assert (= (and b!199761 condMapEmpty!8273) mapIsEmpty!8273))

(assert (= (and b!199761 (not condMapEmpty!8273)) mapNonEmpty!8273))

(get-info :version)

(assert (= (and mapNonEmpty!8273 ((_ is ValueCellFull!2058) mapValue!8273)) b!199758))

(assert (= (and b!199761 ((_ is ValueCellFull!2058) mapDefault!8273)) b!199754))

(assert (= start!20288 b!199761))

(declare-fun m!226199 () Bool)

(assert (=> b!199760 m!226199))

(declare-fun m!226201 () Bool)

(assert (=> b!199762 m!226201))

(declare-fun m!226203 () Bool)

(assert (=> mapNonEmpty!8273 m!226203))

(declare-fun m!226205 () Bool)

(assert (=> b!199759 m!226205))

(declare-fun m!226207 () Bool)

(assert (=> b!199757 m!226207))

(declare-fun m!226209 () Bool)

(assert (=> b!199757 m!226209))

(declare-fun m!226211 () Bool)

(assert (=> b!199757 m!226211))

(declare-fun m!226213 () Bool)

(assert (=> b!199757 m!226213))

(declare-fun m!226215 () Bool)

(assert (=> b!199757 m!226215))

(declare-fun m!226217 () Bool)

(assert (=> b!199757 m!226217))

(declare-fun m!226219 () Bool)

(assert (=> b!199755 m!226219))

(declare-fun m!226221 () Bool)

(assert (=> start!20288 m!226221))

(declare-fun m!226223 () Bool)

(assert (=> start!20288 m!226223))

(declare-fun m!226225 () Bool)

(assert (=> start!20288 m!226225))

(check-sat tp_is_empty!4803 (not mapNonEmpty!8273) (not b_next!4947) (not b!199757) (not b!199762) b_and!11693 (not b!199760) (not start!20288) (not b!199759))
(check-sat b_and!11693 (not b_next!4947))
