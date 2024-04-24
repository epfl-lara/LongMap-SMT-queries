; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!40554 () Bool)

(assert start!40554)

(declare-fun b_free!10579 () Bool)

(declare-fun b_next!10579 () Bool)

(assert (=> start!40554 (= b_free!10579 (not b_next!10579))))

(declare-fun tp!37557 () Bool)

(declare-fun b_and!18601 () Bool)

(assert (=> start!40554 (= tp!37557 b_and!18601)))

(declare-fun res!265543 () Bool)

(declare-fun e!262599 () Bool)

(assert (=> start!40554 (=> (not res!265543) (not e!262599))))

(declare-fun from!863 () (_ BitVec 32))

(declare-datatypes ((array!27644 0))(
  ( (array!27645 (arr!13267 (Array (_ BitVec 32) (_ BitVec 64))) (size!13619 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!27644)

(assert (=> start!40554 (= res!265543 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13619 _keys!709))))))

(assert (=> start!40554 e!262599))

(declare-fun tp_is_empty!11917 () Bool)

(assert (=> start!40554 tp_is_empty!11917))

(assert (=> start!40554 tp!37557))

(assert (=> start!40554 true))

(declare-datatypes ((V!16995 0))(
  ( (V!16996 (val!6003 Int)) )
))
(declare-datatypes ((ValueCell!5615 0))(
  ( (ValueCellFull!5615 (v!8259 V!16995)) (EmptyCell!5615) )
))
(declare-datatypes ((array!27646 0))(
  ( (array!27647 (arr!13268 (Array (_ BitVec 32) ValueCell!5615)) (size!13620 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!27646)

(declare-fun e!262598 () Bool)

(declare-fun array_inv!9694 (array!27646) Bool)

(assert (=> start!40554 (and (array_inv!9694 _values!549) e!262598)))

(declare-fun array_inv!9695 (array!27644) Bool)

(assert (=> start!40554 (array_inv!9695 _keys!709)))

(declare-fun b!447148 () Bool)

(declare-fun e!262600 () Bool)

(assert (=> b!447148 (= e!262599 e!262600)))

(declare-fun res!265546 () Bool)

(assert (=> b!447148 (=> (not res!265546) (not e!262600))))

(declare-fun lt!203944 () array!27644)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!27644 (_ BitVec 32)) Bool)

(assert (=> b!447148 (= res!265546 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!203944 mask!1025))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!447148 (= lt!203944 (array!27645 (store (arr!13267 _keys!709) i!563 k0!794) (size!13619 _keys!709)))))

(declare-fun b!447149 () Bool)

(declare-fun res!265542 () Bool)

(assert (=> b!447149 (=> (not res!265542) (not e!262599))))

(assert (=> b!447149 (= res!265542 (or (= (select (arr!13267 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!13267 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!447150 () Bool)

(declare-fun e!262597 () Bool)

(assert (=> b!447150 (= e!262597 tp_is_empty!11917)))

(declare-fun b!447151 () Bool)

(declare-fun e!262601 () Bool)

(assert (=> b!447151 (= e!262601 tp_is_empty!11917)))

(declare-fun b!447152 () Bool)

(declare-fun res!265545 () Bool)

(assert (=> b!447152 (=> (not res!265545) (not e!262599))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(assert (=> b!447152 (= res!265545 (and (= (size!13620 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13619 _keys!709) (size!13620 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!19509 () Bool)

(declare-fun mapRes!19509 () Bool)

(assert (=> mapIsEmpty!19509 mapRes!19509))

(declare-fun b!447153 () Bool)

(declare-fun res!265547 () Bool)

(assert (=> b!447153 (=> (not res!265547) (not e!262600))))

(assert (=> b!447153 (= res!265547 (bvsle from!863 i!563))))

(declare-fun b!447154 () Bool)

(assert (=> b!447154 (= e!262598 (and e!262601 mapRes!19509))))

(declare-fun condMapEmpty!19509 () Bool)

(declare-fun mapDefault!19509 () ValueCell!5615)

(assert (=> b!447154 (= condMapEmpty!19509 (= (arr!13268 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5615)) mapDefault!19509)))))

(declare-fun b!447155 () Bool)

(declare-fun res!265540 () Bool)

(assert (=> b!447155 (=> (not res!265540) (not e!262599))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!447155 (= res!265540 (validMask!0 mask!1025))))

(declare-fun b!447156 () Bool)

(declare-fun res!265539 () Bool)

(assert (=> b!447156 (=> (not res!265539) (not e!262599))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!447156 (= res!265539 (validKeyInArray!0 k0!794))))

(declare-fun b!447157 () Bool)

(declare-fun res!265538 () Bool)

(assert (=> b!447157 (=> (not res!265538) (not e!262599))))

(assert (=> b!447157 (= res!265538 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13619 _keys!709))))))

(declare-fun b!447158 () Bool)

(assert (=> b!447158 (= e!262600 (bvsge i!563 (size!13620 _values!549)))))

(declare-fun minValue!515 () V!16995)

(declare-fun defaultEntry!557 () Int)

(declare-fun zeroValue!515 () V!16995)

(declare-datatypes ((tuple2!7778 0))(
  ( (tuple2!7779 (_1!3900 (_ BitVec 64)) (_2!3900 V!16995)) )
))
(declare-datatypes ((List!7849 0))(
  ( (Nil!7846) (Cons!7845 (h!8701 tuple2!7778) (t!13603 List!7849)) )
))
(declare-datatypes ((ListLongMap!6693 0))(
  ( (ListLongMap!6694 (toList!3362 List!7849)) )
))
(declare-fun lt!203943 () ListLongMap!6693)

(declare-fun getCurrentListMapNoExtraKeys!1592 (array!27644 array!27646 (_ BitVec 32) (_ BitVec 32) V!16995 V!16995 (_ BitVec 32) Int) ListLongMap!6693)

(assert (=> b!447158 (= lt!203943 (getCurrentListMapNoExtraKeys!1592 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!447159 () Bool)

(declare-fun res!265548 () Bool)

(assert (=> b!447159 (=> (not res!265548) (not e!262599))))

(assert (=> b!447159 (= res!265548 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun mapNonEmpty!19509 () Bool)

(declare-fun tp!37556 () Bool)

(assert (=> mapNonEmpty!19509 (= mapRes!19509 (and tp!37556 e!262597))))

(declare-fun mapRest!19509 () (Array (_ BitVec 32) ValueCell!5615))

(declare-fun mapKey!19509 () (_ BitVec 32))

(declare-fun mapValue!19509 () ValueCell!5615)

(assert (=> mapNonEmpty!19509 (= (arr!13268 _values!549) (store mapRest!19509 mapKey!19509 mapValue!19509))))

(declare-fun b!447160 () Bool)

(declare-fun res!265541 () Bool)

(assert (=> b!447160 (=> (not res!265541) (not e!262599))))

(declare-datatypes ((List!7850 0))(
  ( (Nil!7847) (Cons!7846 (h!8702 (_ BitVec 64)) (t!13604 List!7850)) )
))
(declare-fun arrayNoDuplicates!0 (array!27644 (_ BitVec 32) List!7850) Bool)

(assert (=> b!447160 (= res!265541 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7847))))

(declare-fun b!447161 () Bool)

(declare-fun res!265537 () Bool)

(assert (=> b!447161 (=> (not res!265537) (not e!262599))))

(declare-fun arrayContainsKey!0 (array!27644 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!447161 (= res!265537 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!447162 () Bool)

(declare-fun res!265544 () Bool)

(assert (=> b!447162 (=> (not res!265544) (not e!262600))))

(assert (=> b!447162 (= res!265544 (arrayNoDuplicates!0 lt!203944 #b00000000000000000000000000000000 Nil!7847))))

(assert (= (and start!40554 res!265543) b!447155))

(assert (= (and b!447155 res!265540) b!447152))

(assert (= (and b!447152 res!265545) b!447159))

(assert (= (and b!447159 res!265548) b!447160))

(assert (= (and b!447160 res!265541) b!447157))

(assert (= (and b!447157 res!265538) b!447156))

(assert (= (and b!447156 res!265539) b!447149))

(assert (= (and b!447149 res!265542) b!447161))

(assert (= (and b!447161 res!265537) b!447148))

(assert (= (and b!447148 res!265546) b!447162))

(assert (= (and b!447162 res!265544) b!447153))

(assert (= (and b!447153 res!265547) b!447158))

(assert (= (and b!447154 condMapEmpty!19509) mapIsEmpty!19509))

(assert (= (and b!447154 (not condMapEmpty!19509)) mapNonEmpty!19509))

(get-info :version)

(assert (= (and mapNonEmpty!19509 ((_ is ValueCellFull!5615) mapValue!19509)) b!447150))

(assert (= (and b!447154 ((_ is ValueCellFull!5615) mapDefault!19509)) b!447151))

(assert (= start!40554 b!447154))

(declare-fun m!432393 () Bool)

(assert (=> b!447161 m!432393))

(declare-fun m!432395 () Bool)

(assert (=> b!447156 m!432395))

(declare-fun m!432397 () Bool)

(assert (=> b!447158 m!432397))

(declare-fun m!432399 () Bool)

(assert (=> mapNonEmpty!19509 m!432399))

(declare-fun m!432401 () Bool)

(assert (=> start!40554 m!432401))

(declare-fun m!432403 () Bool)

(assert (=> start!40554 m!432403))

(declare-fun m!432405 () Bool)

(assert (=> b!447149 m!432405))

(declare-fun m!432407 () Bool)

(assert (=> b!447155 m!432407))

(declare-fun m!432409 () Bool)

(assert (=> b!447162 m!432409))

(declare-fun m!432411 () Bool)

(assert (=> b!447160 m!432411))

(declare-fun m!432413 () Bool)

(assert (=> b!447159 m!432413))

(declare-fun m!432415 () Bool)

(assert (=> b!447148 m!432415))

(declare-fun m!432417 () Bool)

(assert (=> b!447148 m!432417))

(check-sat (not mapNonEmpty!19509) (not b!447156) (not start!40554) tp_is_empty!11917 b_and!18601 (not b!447160) (not b!447158) (not b!447159) (not b!447148) (not b!447155) (not b_next!10579) (not b!447162) (not b!447161))
(check-sat b_and!18601 (not b_next!10579))
