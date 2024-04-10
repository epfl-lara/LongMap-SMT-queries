; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!21046 () Bool)

(assert start!21046)

(declare-fun b_free!5577 () Bool)

(declare-fun b_next!5577 () Bool)

(assert (=> start!21046 (= b_free!5577 (not b_next!5577))))

(declare-fun tp!19789 () Bool)

(declare-fun b_and!12395 () Bool)

(assert (=> start!21046 (= tp!19789 b_and!12395)))

(declare-fun res!103355 () Bool)

(declare-fun e!137730 () Bool)

(assert (=> start!21046 (=> (not res!103355) (not e!137730))))

(declare-fun mask!1149 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!21046 (= res!103355 (validMask!0 mask!1149))))

(assert (=> start!21046 e!137730))

(declare-datatypes ((V!6899 0))(
  ( (V!6900 (val!2764 Int)) )
))
(declare-datatypes ((ValueCell!2376 0))(
  ( (ValueCellFull!2376 (v!4758 V!6899)) (EmptyCell!2376) )
))
(declare-datatypes ((array!10079 0))(
  ( (array!10080 (arr!4784 (Array (_ BitVec 32) ValueCell!2376)) (size!5109 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!10079)

(declare-fun e!137735 () Bool)

(declare-fun array_inv!3165 (array!10079) Bool)

(assert (=> start!21046 (and (array_inv!3165 _values!649) e!137735)))

(assert (=> start!21046 true))

(declare-fun tp_is_empty!5439 () Bool)

(assert (=> start!21046 tp_is_empty!5439))

(declare-datatypes ((array!10081 0))(
  ( (array!10082 (arr!4785 (Array (_ BitVec 32) (_ BitVec 64))) (size!5110 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!10081)

(declare-fun array_inv!3166 (array!10081) Bool)

(assert (=> start!21046 (array_inv!3166 _keys!825)))

(assert (=> start!21046 tp!19789))

(declare-datatypes ((tuple2!4180 0))(
  ( (tuple2!4181 (_1!2101 (_ BitVec 64)) (_2!2101 V!6899)) )
))
(declare-datatypes ((List!3070 0))(
  ( (Nil!3067) (Cons!3066 (h!3708 tuple2!4180) (t!8013 List!3070)) )
))
(declare-datatypes ((ListLongMap!3093 0))(
  ( (ListLongMap!3094 (toList!1562 List!3070)) )
))
(declare-fun lt!108843 () ListLongMap!3093)

(declare-fun lt!108845 () tuple2!4180)

(declare-fun b!211604 () Bool)

(declare-fun e!137734 () Bool)

(declare-fun lt!108848 () ListLongMap!3093)

(declare-fun +!565 (ListLongMap!3093 tuple2!4180) ListLongMap!3093)

(assert (=> b!211604 (= e!137734 (= lt!108843 (+!565 lt!108848 lt!108845)))))

(declare-fun e!137732 () Bool)

(declare-fun b!211605 () Bool)

(declare-fun lt!108850 () ListLongMap!3093)

(declare-fun lt!108846 () ListLongMap!3093)

(assert (=> b!211605 (= e!137732 (= lt!108846 (+!565 lt!108850 lt!108845)))))

(assert (=> b!211605 e!137734))

(declare-fun res!103356 () Bool)

(assert (=> b!211605 (=> (not res!103356) (not e!137734))))

(declare-fun lt!108844 () ListLongMap!3093)

(assert (=> b!211605 (= res!103356 (= lt!108846 (+!565 lt!108844 lt!108845)))))

(declare-fun zeroValue!615 () V!6899)

(assert (=> b!211605 (= lt!108845 (tuple2!4181 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!615))))

(declare-fun b!211606 () Bool)

(assert (=> b!211606 (= e!137730 (not e!137732))))

(declare-fun res!103352 () Bool)

(assert (=> b!211606 (=> res!103352 e!137732)))

(declare-fun extraKeys!596 () (_ BitVec 32))

(assert (=> b!211606 (= res!103352 (or (not (= (bvand extraKeys!596 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!596 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun defaultEntry!657 () Int)

(declare-fun minValue!615 () V!6899)

(declare-fun getCurrentListMap!1095 (array!10081 array!10079 (_ BitVec 32) (_ BitVec 32) V!6899 V!6899 (_ BitVec 32) Int) ListLongMap!3093)

(assert (=> b!211606 (= lt!108843 (getCurrentListMap!1095 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!108849 () array!10079)

(assert (=> b!211606 (= lt!108846 (getCurrentListMap!1095 _keys!825 lt!108849 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (=> b!211606 (and (= lt!108844 lt!108850) (= lt!108850 lt!108844))))

(declare-fun v!520 () V!6899)

(declare-fun k0!843 () (_ BitVec 64))

(assert (=> b!211606 (= lt!108850 (+!565 lt!108848 (tuple2!4181 k0!843 v!520)))))

(declare-datatypes ((Unit!6422 0))(
  ( (Unit!6423) )
))
(declare-fun lt!108847 () Unit!6422)

(declare-fun i!601 () (_ BitVec 32))

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!212 (array!10081 array!10079 (_ BitVec 32) (_ BitVec 32) V!6899 V!6899 (_ BitVec 32) (_ BitVec 64) V!6899 (_ BitVec 32) Int) Unit!6422)

(assert (=> b!211606 (= lt!108847 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!212 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 i!601 k0!843 v!520 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun getCurrentListMapNoExtraKeys!497 (array!10081 array!10079 (_ BitVec 32) (_ BitVec 32) V!6899 V!6899 (_ BitVec 32) Int) ListLongMap!3093)

(assert (=> b!211606 (= lt!108844 (getCurrentListMapNoExtraKeys!497 _keys!825 lt!108849 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (=> b!211606 (= lt!108849 (array!10080 (store (arr!4784 _values!649) i!601 (ValueCellFull!2376 v!520)) (size!5109 _values!649)))))

(assert (=> b!211606 (= lt!108848 (getCurrentListMapNoExtraKeys!497 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun b!211607 () Bool)

(declare-fun e!137731 () Bool)

(declare-fun mapRes!9245 () Bool)

(assert (=> b!211607 (= e!137735 (and e!137731 mapRes!9245))))

(declare-fun condMapEmpty!9245 () Bool)

(declare-fun mapDefault!9245 () ValueCell!2376)

(assert (=> b!211607 (= condMapEmpty!9245 (= (arr!4784 _values!649) ((as const (Array (_ BitVec 32) ValueCell!2376)) mapDefault!9245)))))

(declare-fun mapNonEmpty!9245 () Bool)

(declare-fun tp!19790 () Bool)

(declare-fun e!137733 () Bool)

(assert (=> mapNonEmpty!9245 (= mapRes!9245 (and tp!19790 e!137733))))

(declare-fun mapKey!9245 () (_ BitVec 32))

(declare-fun mapRest!9245 () (Array (_ BitVec 32) ValueCell!2376))

(declare-fun mapValue!9245 () ValueCell!2376)

(assert (=> mapNonEmpty!9245 (= (arr!4784 _values!649) (store mapRest!9245 mapKey!9245 mapValue!9245))))

(declare-fun b!211608 () Bool)

(assert (=> b!211608 (= e!137731 tp_is_empty!5439)))

(declare-fun b!211609 () Bool)

(assert (=> b!211609 (= e!137733 tp_is_empty!5439)))

(declare-fun b!211610 () Bool)

(declare-fun res!103350 () Bool)

(assert (=> b!211610 (=> (not res!103350) (not e!137730))))

(declare-datatypes ((List!3071 0))(
  ( (Nil!3068) (Cons!3067 (h!3709 (_ BitVec 64)) (t!8014 List!3071)) )
))
(declare-fun arrayNoDuplicates!0 (array!10081 (_ BitVec 32) List!3071) Bool)

(assert (=> b!211610 (= res!103350 (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!3068))))

(declare-fun b!211611 () Bool)

(declare-fun res!103351 () Bool)

(assert (=> b!211611 (=> (not res!103351) (not e!137730))))

(assert (=> b!211611 (= res!103351 (and (= (size!5109 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!5110 _keys!825) (size!5109 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011)))))

(declare-fun b!211612 () Bool)

(declare-fun res!103354 () Bool)

(assert (=> b!211612 (=> (not res!103354) (not e!137730))))

(assert (=> b!211612 (= res!103354 (= (select (arr!4785 _keys!825) i!601) k0!843))))

(declare-fun mapIsEmpty!9245 () Bool)

(assert (=> mapIsEmpty!9245 mapRes!9245))

(declare-fun b!211613 () Bool)

(declare-fun res!103349 () Bool)

(assert (=> b!211613 (=> (not res!103349) (not e!137730))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!211613 (= res!103349 (validKeyInArray!0 k0!843))))

(declare-fun b!211614 () Bool)

(declare-fun res!103348 () Bool)

(assert (=> b!211614 (=> (not res!103348) (not e!137730))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!10081 (_ BitVec 32)) Bool)

(assert (=> b!211614 (= res!103348 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149))))

(declare-fun b!211615 () Bool)

(declare-fun res!103353 () Bool)

(assert (=> b!211615 (=> (not res!103353) (not e!137730))))

(assert (=> b!211615 (= res!103353 (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!5110 _keys!825))))))

(assert (= (and start!21046 res!103355) b!211611))

(assert (= (and b!211611 res!103351) b!211614))

(assert (= (and b!211614 res!103348) b!211610))

(assert (= (and b!211610 res!103350) b!211615))

(assert (= (and b!211615 res!103353) b!211613))

(assert (= (and b!211613 res!103349) b!211612))

(assert (= (and b!211612 res!103354) b!211606))

(assert (= (and b!211606 (not res!103352)) b!211605))

(assert (= (and b!211605 res!103356) b!211604))

(assert (= (and b!211607 condMapEmpty!9245) mapIsEmpty!9245))

(assert (= (and b!211607 (not condMapEmpty!9245)) mapNonEmpty!9245))

(get-info :version)

(assert (= (and mapNonEmpty!9245 ((_ is ValueCellFull!2376) mapValue!9245)) b!211609))

(assert (= (and b!211607 ((_ is ValueCellFull!2376) mapDefault!9245)) b!211608))

(assert (= start!21046 b!211607))

(declare-fun m!239357 () Bool)

(assert (=> b!211604 m!239357))

(declare-fun m!239359 () Bool)

(assert (=> b!211606 m!239359))

(declare-fun m!239361 () Bool)

(assert (=> b!211606 m!239361))

(declare-fun m!239363 () Bool)

(assert (=> b!211606 m!239363))

(declare-fun m!239365 () Bool)

(assert (=> b!211606 m!239365))

(declare-fun m!239367 () Bool)

(assert (=> b!211606 m!239367))

(declare-fun m!239369 () Bool)

(assert (=> b!211606 m!239369))

(declare-fun m!239371 () Bool)

(assert (=> b!211606 m!239371))

(declare-fun m!239373 () Bool)

(assert (=> start!21046 m!239373))

(declare-fun m!239375 () Bool)

(assert (=> start!21046 m!239375))

(declare-fun m!239377 () Bool)

(assert (=> start!21046 m!239377))

(declare-fun m!239379 () Bool)

(assert (=> b!211614 m!239379))

(declare-fun m!239381 () Bool)

(assert (=> b!211610 m!239381))

(declare-fun m!239383 () Bool)

(assert (=> mapNonEmpty!9245 m!239383))

(declare-fun m!239385 () Bool)

(assert (=> b!211612 m!239385))

(declare-fun m!239387 () Bool)

(assert (=> b!211605 m!239387))

(declare-fun m!239389 () Bool)

(assert (=> b!211605 m!239389))

(declare-fun m!239391 () Bool)

(assert (=> b!211613 m!239391))

(check-sat (not b!211614) (not b!211605) b_and!12395 (not b_next!5577) (not b!211606) (not b!211604) (not start!21046) (not b!211613) tp_is_empty!5439 (not mapNonEmpty!9245) (not b!211610))
(check-sat b_and!12395 (not b_next!5577))
