; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!40368 () Bool)

(assert start!40368)

(declare-fun b!443524 () Bool)

(declare-fun e!260906 () Bool)

(declare-fun e!260901 () Bool)

(assert (=> b!443524 (= e!260906 e!260901)))

(declare-fun res!262913 () Bool)

(assert (=> b!443524 (=> (not res!262913) (not e!260901))))

(declare-datatypes ((array!27347 0))(
  ( (array!27348 (arr!13121 (Array (_ BitVec 32) (_ BitVec 64))) (size!13474 (_ BitVec 32))) )
))
(declare-fun lt!203158 () array!27347)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!27347 (_ BitVec 32)) Bool)

(assert (=> b!443524 (= res!262913 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!203158 mask!1025))))

(declare-fun _keys!709 () array!27347)

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!443524 (= lt!203158 (array!27348 (store (arr!13121 _keys!709) i!563 k0!794) (size!13474 _keys!709)))))

(declare-fun mapNonEmpty!19278 () Bool)

(declare-fun mapRes!19278 () Bool)

(declare-fun tp!37260 () Bool)

(declare-fun e!260904 () Bool)

(assert (=> mapNonEmpty!19278 (= mapRes!19278 (and tp!37260 e!260904))))

(declare-datatypes ((V!16795 0))(
  ( (V!16796 (val!5928 Int)) )
))
(declare-datatypes ((ValueCell!5540 0))(
  ( (ValueCellFull!5540 (v!8173 V!16795)) (EmptyCell!5540) )
))
(declare-fun mapRest!19278 () (Array (_ BitVec 32) ValueCell!5540))

(declare-datatypes ((array!27349 0))(
  ( (array!27350 (arr!13122 (Array (_ BitVec 32) ValueCell!5540)) (size!13475 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!27349)

(declare-fun mapValue!19278 () ValueCell!5540)

(declare-fun mapKey!19278 () (_ BitVec 32))

(assert (=> mapNonEmpty!19278 (= (arr!13122 _values!549) (store mapRest!19278 mapKey!19278 mapValue!19278))))

(declare-fun b!443525 () Bool)

(assert (=> b!443525 (= e!260901 false)))

(declare-fun lt!203159 () Bool)

(declare-datatypes ((List!7862 0))(
  ( (Nil!7859) (Cons!7858 (h!8714 (_ BitVec 64)) (t!13611 List!7862)) )
))
(declare-fun arrayNoDuplicates!0 (array!27347 (_ BitVec 32) List!7862) Bool)

(assert (=> b!443525 (= lt!203159 (arrayNoDuplicates!0 lt!203158 #b00000000000000000000000000000000 Nil!7859))))

(declare-fun b!443526 () Bool)

(declare-fun res!262916 () Bool)

(assert (=> b!443526 (=> (not res!262916) (not e!260906))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(assert (=> b!443526 (= res!262916 (and (= (size!13475 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13474 _keys!709) (size!13475 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!443527 () Bool)

(declare-fun e!260905 () Bool)

(declare-fun tp_is_empty!11767 () Bool)

(assert (=> b!443527 (= e!260905 tp_is_empty!11767)))

(declare-fun b!443528 () Bool)

(declare-fun res!262919 () Bool)

(assert (=> b!443528 (=> (not res!262919) (not e!260906))))

(declare-fun arrayContainsKey!0 (array!27347 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!443528 (= res!262919 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!443529 () Bool)

(declare-fun res!262920 () Bool)

(assert (=> b!443529 (=> (not res!262920) (not e!260906))))

(assert (=> b!443529 (= res!262920 (or (= (select (arr!13121 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!13121 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!443530 () Bool)

(declare-fun res!262921 () Bool)

(assert (=> b!443530 (=> (not res!262921) (not e!260906))))

(assert (=> b!443530 (= res!262921 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13474 _keys!709))))))

(declare-fun b!443531 () Bool)

(declare-fun res!262917 () Bool)

(assert (=> b!443531 (=> (not res!262917) (not e!260906))))

(assert (=> b!443531 (= res!262917 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7859))))

(declare-fun b!443532 () Bool)

(assert (=> b!443532 (= e!260904 tp_is_empty!11767)))

(declare-fun b!443533 () Bool)

(declare-fun res!262912 () Bool)

(assert (=> b!443533 (=> (not res!262912) (not e!260906))))

(assert (=> b!443533 (= res!262912 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun res!262914 () Bool)

(assert (=> start!40368 (=> (not res!262914) (not e!260906))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> start!40368 (= res!262914 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13474 _keys!709))))))

(assert (=> start!40368 e!260906))

(assert (=> start!40368 true))

(declare-fun e!260903 () Bool)

(declare-fun array_inv!9566 (array!27349) Bool)

(assert (=> start!40368 (and (array_inv!9566 _values!549) e!260903)))

(declare-fun array_inv!9567 (array!27347) Bool)

(assert (=> start!40368 (array_inv!9567 _keys!709)))

(declare-fun b!443534 () Bool)

(assert (=> b!443534 (= e!260903 (and e!260905 mapRes!19278))))

(declare-fun condMapEmpty!19278 () Bool)

(declare-fun mapDefault!19278 () ValueCell!5540)

(assert (=> b!443534 (= condMapEmpty!19278 (= (arr!13122 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5540)) mapDefault!19278)))))

(declare-fun b!443535 () Bool)

(declare-fun res!262915 () Bool)

(assert (=> b!443535 (=> (not res!262915) (not e!260906))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!443535 (= res!262915 (validMask!0 mask!1025))))

(declare-fun mapIsEmpty!19278 () Bool)

(assert (=> mapIsEmpty!19278 mapRes!19278))

(declare-fun b!443536 () Bool)

(declare-fun res!262918 () Bool)

(assert (=> b!443536 (=> (not res!262918) (not e!260906))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!443536 (= res!262918 (validKeyInArray!0 k0!794))))

(assert (= (and start!40368 res!262914) b!443535))

(assert (= (and b!443535 res!262915) b!443526))

(assert (= (and b!443526 res!262916) b!443533))

(assert (= (and b!443533 res!262912) b!443531))

(assert (= (and b!443531 res!262917) b!443530))

(assert (= (and b!443530 res!262921) b!443536))

(assert (= (and b!443536 res!262918) b!443529))

(assert (= (and b!443529 res!262920) b!443528))

(assert (= (and b!443528 res!262919) b!443524))

(assert (= (and b!443524 res!262913) b!443525))

(assert (= (and b!443534 condMapEmpty!19278) mapIsEmpty!19278))

(assert (= (and b!443534 (not condMapEmpty!19278)) mapNonEmpty!19278))

(get-info :version)

(assert (= (and mapNonEmpty!19278 ((_ is ValueCellFull!5540) mapValue!19278)) b!443532))

(assert (= (and b!443534 ((_ is ValueCellFull!5540) mapDefault!19278)) b!443527))

(assert (= start!40368 b!443534))

(declare-fun m!429193 () Bool)

(assert (=> b!443536 m!429193))

(declare-fun m!429195 () Bool)

(assert (=> b!443531 m!429195))

(declare-fun m!429197 () Bool)

(assert (=> b!443533 m!429197))

(declare-fun m!429199 () Bool)

(assert (=> start!40368 m!429199))

(declare-fun m!429201 () Bool)

(assert (=> start!40368 m!429201))

(declare-fun m!429203 () Bool)

(assert (=> b!443529 m!429203))

(declare-fun m!429205 () Bool)

(assert (=> b!443528 m!429205))

(declare-fun m!429207 () Bool)

(assert (=> mapNonEmpty!19278 m!429207))

(declare-fun m!429209 () Bool)

(assert (=> b!443524 m!429209))

(declare-fun m!429211 () Bool)

(assert (=> b!443524 m!429211))

(declare-fun m!429213 () Bool)

(assert (=> b!443525 m!429213))

(declare-fun m!429215 () Bool)

(assert (=> b!443535 m!429215))

(check-sat (not b!443531) (not b!443525) (not b!443536) (not start!40368) (not b!443533) (not b!443528) (not b!443524) (not b!443535) tp_is_empty!11767 (not mapNonEmpty!19278))
(check-sat)
