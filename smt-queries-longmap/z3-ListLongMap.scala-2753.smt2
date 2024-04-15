; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!40356 () Bool)

(assert start!40356)

(declare-fun b!443290 () Bool)

(declare-fun res!262732 () Bool)

(declare-fun e!260797 () Bool)

(assert (=> b!443290 (=> (not res!262732) (not e!260797))))

(declare-datatypes ((array!27323 0))(
  ( (array!27324 (arr!13109 (Array (_ BitVec 32) (_ BitVec 64))) (size!13462 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!27323)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!27323 (_ BitVec 32)) Bool)

(assert (=> b!443290 (= res!262732 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!443291 () Bool)

(declare-fun res!262733 () Bool)

(assert (=> b!443291 (=> (not res!262733) (not e!260797))))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!443291 (= res!262733 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13462 _keys!709))))))

(declare-fun b!443292 () Bool)

(declare-fun e!260796 () Bool)

(declare-fun tp_is_empty!11755 () Bool)

(assert (=> b!443292 (= e!260796 tp_is_empty!11755)))

(declare-fun b!443293 () Bool)

(declare-fun e!260798 () Bool)

(assert (=> b!443293 (= e!260798 false)))

(declare-fun lt!203122 () Bool)

(declare-fun lt!203123 () array!27323)

(declare-datatypes ((List!7859 0))(
  ( (Nil!7856) (Cons!7855 (h!8711 (_ BitVec 64)) (t!13608 List!7859)) )
))
(declare-fun arrayNoDuplicates!0 (array!27323 (_ BitVec 32) List!7859) Bool)

(assert (=> b!443293 (= lt!203122 (arrayNoDuplicates!0 lt!203123 #b00000000000000000000000000000000 Nil!7856))))

(declare-fun mapIsEmpty!19260 () Bool)

(declare-fun mapRes!19260 () Bool)

(assert (=> mapIsEmpty!19260 mapRes!19260))

(declare-fun b!443294 () Bool)

(assert (=> b!443294 (= e!260797 e!260798)))

(declare-fun res!262739 () Bool)

(assert (=> b!443294 (=> (not res!262739) (not e!260798))))

(assert (=> b!443294 (= res!262739 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!203123 mask!1025))))

(declare-fun k0!794 () (_ BitVec 64))

(assert (=> b!443294 (= lt!203123 (array!27324 (store (arr!13109 _keys!709) i!563 k0!794) (size!13462 _keys!709)))))

(declare-fun b!443295 () Bool)

(declare-fun e!260793 () Bool)

(assert (=> b!443295 (= e!260793 (and e!260796 mapRes!19260))))

(declare-fun condMapEmpty!19260 () Bool)

(declare-datatypes ((V!16779 0))(
  ( (V!16780 (val!5922 Int)) )
))
(declare-datatypes ((ValueCell!5534 0))(
  ( (ValueCellFull!5534 (v!8167 V!16779)) (EmptyCell!5534) )
))
(declare-datatypes ((array!27325 0))(
  ( (array!27326 (arr!13110 (Array (_ BitVec 32) ValueCell!5534)) (size!13463 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!27325)

(declare-fun mapDefault!19260 () ValueCell!5534)

(assert (=> b!443295 (= condMapEmpty!19260 (= (arr!13110 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5534)) mapDefault!19260)))))

(declare-fun b!443296 () Bool)

(declare-fun res!262736 () Bool)

(assert (=> b!443296 (=> (not res!262736) (not e!260797))))

(assert (=> b!443296 (= res!262736 (or (= (select (arr!13109 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!13109 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!443297 () Bool)

(declare-fun res!262734 () Bool)

(assert (=> b!443297 (=> (not res!262734) (not e!260797))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!443297 (= res!262734 (validMask!0 mask!1025))))

(declare-fun b!443298 () Bool)

(declare-fun res!262738 () Bool)

(assert (=> b!443298 (=> (not res!262738) (not e!260797))))

(assert (=> b!443298 (= res!262738 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7856))))

(declare-fun b!443299 () Bool)

(declare-fun res!262735 () Bool)

(assert (=> b!443299 (=> (not res!262735) (not e!260797))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(assert (=> b!443299 (= res!262735 (and (= (size!13463 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13462 _keys!709) (size!13463 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!443300 () Bool)

(declare-fun res!262737 () Bool)

(assert (=> b!443300 (=> (not res!262737) (not e!260797))))

(declare-fun arrayContainsKey!0 (array!27323 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!443300 (= res!262737 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!443301 () Bool)

(declare-fun e!260794 () Bool)

(assert (=> b!443301 (= e!260794 tp_is_empty!11755)))

(declare-fun b!443302 () Bool)

(declare-fun res!262741 () Bool)

(assert (=> b!443302 (=> (not res!262741) (not e!260797))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!443302 (= res!262741 (validKeyInArray!0 k0!794))))

(declare-fun mapNonEmpty!19260 () Bool)

(declare-fun tp!37242 () Bool)

(assert (=> mapNonEmpty!19260 (= mapRes!19260 (and tp!37242 e!260794))))

(declare-fun mapRest!19260 () (Array (_ BitVec 32) ValueCell!5534))

(declare-fun mapKey!19260 () (_ BitVec 32))

(declare-fun mapValue!19260 () ValueCell!5534)

(assert (=> mapNonEmpty!19260 (= (arr!13110 _values!549) (store mapRest!19260 mapKey!19260 mapValue!19260))))

(declare-fun res!262740 () Bool)

(assert (=> start!40356 (=> (not res!262740) (not e!260797))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> start!40356 (= res!262740 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13462 _keys!709))))))

(assert (=> start!40356 e!260797))

(assert (=> start!40356 true))

(declare-fun array_inv!9560 (array!27325) Bool)

(assert (=> start!40356 (and (array_inv!9560 _values!549) e!260793)))

(declare-fun array_inv!9561 (array!27323) Bool)

(assert (=> start!40356 (array_inv!9561 _keys!709)))

(assert (= (and start!40356 res!262740) b!443297))

(assert (= (and b!443297 res!262734) b!443299))

(assert (= (and b!443299 res!262735) b!443290))

(assert (= (and b!443290 res!262732) b!443298))

(assert (= (and b!443298 res!262738) b!443291))

(assert (= (and b!443291 res!262733) b!443302))

(assert (= (and b!443302 res!262741) b!443296))

(assert (= (and b!443296 res!262736) b!443300))

(assert (= (and b!443300 res!262737) b!443294))

(assert (= (and b!443294 res!262739) b!443293))

(assert (= (and b!443295 condMapEmpty!19260) mapIsEmpty!19260))

(assert (= (and b!443295 (not condMapEmpty!19260)) mapNonEmpty!19260))

(get-info :version)

(assert (= (and mapNonEmpty!19260 ((_ is ValueCellFull!5534) mapValue!19260)) b!443301))

(assert (= (and b!443295 ((_ is ValueCellFull!5534) mapDefault!19260)) b!443292))

(assert (= start!40356 b!443295))

(declare-fun m!429049 () Bool)

(assert (=> start!40356 m!429049))

(declare-fun m!429051 () Bool)

(assert (=> start!40356 m!429051))

(declare-fun m!429053 () Bool)

(assert (=> b!443302 m!429053))

(declare-fun m!429055 () Bool)

(assert (=> b!443294 m!429055))

(declare-fun m!429057 () Bool)

(assert (=> b!443294 m!429057))

(declare-fun m!429059 () Bool)

(assert (=> b!443300 m!429059))

(declare-fun m!429061 () Bool)

(assert (=> b!443296 m!429061))

(declare-fun m!429063 () Bool)

(assert (=> b!443297 m!429063))

(declare-fun m!429065 () Bool)

(assert (=> b!443293 m!429065))

(declare-fun m!429067 () Bool)

(assert (=> b!443298 m!429067))

(declare-fun m!429069 () Bool)

(assert (=> mapNonEmpty!19260 m!429069))

(declare-fun m!429071 () Bool)

(assert (=> b!443290 m!429071))

(check-sat (not b!443290) (not b!443293) (not start!40356) (not b!443302) (not b!443294) tp_is_empty!11755 (not b!443297) (not b!443300) (not b!443298) (not mapNonEmpty!19260))
(check-sat)
