; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!40514 () Bool)

(assert start!40514)

(declare-fun b!446531 () Bool)

(declare-fun e!262313 () Bool)

(assert (=> b!446531 (= e!262313 false)))

(declare-fun lt!203849 () Bool)

(declare-datatypes ((array!27596 0))(
  ( (array!27597 (arr!13244 (Array (_ BitVec 32) (_ BitVec 64))) (size!13596 (_ BitVec 32))) )
))
(declare-fun lt!203850 () array!27596)

(declare-datatypes ((List!7837 0))(
  ( (Nil!7834) (Cons!7833 (h!8689 (_ BitVec 64)) (t!13589 List!7837)) )
))
(declare-fun arrayNoDuplicates!0 (array!27596 (_ BitVec 32) List!7837) Bool)

(assert (=> b!446531 (= lt!203849 (arrayNoDuplicates!0 lt!203850 #b00000000000000000000000000000000 Nil!7834))))

(declare-fun b!446532 () Bool)

(declare-fun e!262314 () Bool)

(declare-fun e!262316 () Bool)

(declare-fun mapRes!19470 () Bool)

(assert (=> b!446532 (= e!262314 (and e!262316 mapRes!19470))))

(declare-fun condMapEmpty!19470 () Bool)

(declare-datatypes ((V!16963 0))(
  ( (V!16964 (val!5991 Int)) )
))
(declare-datatypes ((ValueCell!5603 0))(
  ( (ValueCellFull!5603 (v!8247 V!16963)) (EmptyCell!5603) )
))
(declare-datatypes ((array!27598 0))(
  ( (array!27599 (arr!13245 (Array (_ BitVec 32) ValueCell!5603)) (size!13597 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!27598)

(declare-fun mapDefault!19470 () ValueCell!5603)

(assert (=> b!446532 (= condMapEmpty!19470 (= (arr!13245 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5603)) mapDefault!19470)))))

(declare-fun mapIsEmpty!19470 () Bool)

(assert (=> mapIsEmpty!19470 mapRes!19470))

(declare-fun res!265094 () Bool)

(declare-fun e!262318 () Bool)

(assert (=> start!40514 (=> (not res!265094) (not e!262318))))

(declare-fun from!863 () (_ BitVec 32))

(declare-fun _keys!709 () array!27596)

(assert (=> start!40514 (= res!265094 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13596 _keys!709))))))

(assert (=> start!40514 e!262318))

(assert (=> start!40514 true))

(declare-fun array_inv!9684 (array!27598) Bool)

(assert (=> start!40514 (and (array_inv!9684 _values!549) e!262314)))

(declare-fun array_inv!9685 (array!27596) Bool)

(assert (=> start!40514 (array_inv!9685 _keys!709)))

(declare-fun b!446533 () Bool)

(declare-fun res!265091 () Bool)

(assert (=> b!446533 (=> (not res!265091) (not e!262318))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun mask!1025 () (_ BitVec 32))

(assert (=> b!446533 (= res!265091 (and (= (size!13597 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13596 _keys!709) (size!13597 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!446534 () Bool)

(declare-fun res!265087 () Bool)

(assert (=> b!446534 (=> (not res!265087) (not e!262318))))

(assert (=> b!446534 (= res!265087 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7834))))

(declare-fun mapNonEmpty!19470 () Bool)

(declare-fun tp!37497 () Bool)

(declare-fun e!262315 () Bool)

(assert (=> mapNonEmpty!19470 (= mapRes!19470 (and tp!37497 e!262315))))

(declare-fun mapKey!19470 () (_ BitVec 32))

(declare-fun mapValue!19470 () ValueCell!5603)

(declare-fun mapRest!19470 () (Array (_ BitVec 32) ValueCell!5603))

(assert (=> mapNonEmpty!19470 (= (arr!13245 _values!549) (store mapRest!19470 mapKey!19470 mapValue!19470))))

(declare-fun b!446535 () Bool)

(declare-fun res!265088 () Bool)

(assert (=> b!446535 (=> (not res!265088) (not e!262318))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!446535 (= res!265088 (validMask!0 mask!1025))))

(declare-fun b!446536 () Bool)

(declare-fun res!265089 () Bool)

(assert (=> b!446536 (=> (not res!265089) (not e!262318))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!27596 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!446536 (= res!265089 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!446537 () Bool)

(declare-fun res!265092 () Bool)

(assert (=> b!446537 (=> (not res!265092) (not e!262318))))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!446537 (= res!265092 (or (= (select (arr!13244 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!13244 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!446538 () Bool)

(declare-fun res!265090 () Bool)

(assert (=> b!446538 (=> (not res!265090) (not e!262318))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!446538 (= res!265090 (validKeyInArray!0 k0!794))))

(declare-fun b!446539 () Bool)

(declare-fun res!265093 () Bool)

(assert (=> b!446539 (=> (not res!265093) (not e!262318))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!27596 (_ BitVec 32)) Bool)

(assert (=> b!446539 (= res!265093 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!446540 () Bool)

(declare-fun res!265095 () Bool)

(assert (=> b!446540 (=> (not res!265095) (not e!262318))))

(assert (=> b!446540 (= res!265095 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13596 _keys!709))))))

(declare-fun b!446541 () Bool)

(declare-fun tp_is_empty!11893 () Bool)

(assert (=> b!446541 (= e!262316 tp_is_empty!11893)))

(declare-fun b!446542 () Bool)

(assert (=> b!446542 (= e!262318 e!262313)))

(declare-fun res!265086 () Bool)

(assert (=> b!446542 (=> (not res!265086) (not e!262313))))

(assert (=> b!446542 (= res!265086 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!203850 mask!1025))))

(assert (=> b!446542 (= lt!203850 (array!27597 (store (arr!13244 _keys!709) i!563 k0!794) (size!13596 _keys!709)))))

(declare-fun b!446543 () Bool)

(assert (=> b!446543 (= e!262315 tp_is_empty!11893)))

(assert (= (and start!40514 res!265094) b!446535))

(assert (= (and b!446535 res!265088) b!446533))

(assert (= (and b!446533 res!265091) b!446539))

(assert (= (and b!446539 res!265093) b!446534))

(assert (= (and b!446534 res!265087) b!446540))

(assert (= (and b!446540 res!265095) b!446538))

(assert (= (and b!446538 res!265090) b!446537))

(assert (= (and b!446537 res!265092) b!446536))

(assert (= (and b!446536 res!265089) b!446542))

(assert (= (and b!446542 res!265086) b!446531))

(assert (= (and b!446532 condMapEmpty!19470) mapIsEmpty!19470))

(assert (= (and b!446532 (not condMapEmpty!19470)) mapNonEmpty!19470))

(get-info :version)

(assert (= (and mapNonEmpty!19470 ((_ is ValueCellFull!5603) mapValue!19470)) b!446543))

(assert (= (and b!446532 ((_ is ValueCellFull!5603) mapDefault!19470)) b!446541))

(assert (= start!40514 b!446532))

(declare-fun m!431987 () Bool)

(assert (=> mapNonEmpty!19470 m!431987))

(declare-fun m!431989 () Bool)

(assert (=> start!40514 m!431989))

(declare-fun m!431991 () Bool)

(assert (=> start!40514 m!431991))

(declare-fun m!431993 () Bool)

(assert (=> b!446534 m!431993))

(declare-fun m!431995 () Bool)

(assert (=> b!446542 m!431995))

(declare-fun m!431997 () Bool)

(assert (=> b!446542 m!431997))

(declare-fun m!431999 () Bool)

(assert (=> b!446536 m!431999))

(declare-fun m!432001 () Bool)

(assert (=> b!446531 m!432001))

(declare-fun m!432003 () Bool)

(assert (=> b!446539 m!432003))

(declare-fun m!432005 () Bool)

(assert (=> b!446538 m!432005))

(declare-fun m!432007 () Bool)

(assert (=> b!446537 m!432007))

(declare-fun m!432009 () Bool)

(assert (=> b!446535 m!432009))

(check-sat (not b!446542) (not b!446535) (not mapNonEmpty!19470) (not b!446538) (not start!40514) (not b!446534) (not b!446536) (not b!446531) (not b!446539) tp_is_empty!11893)
(check-sat)
