; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!40514 () Bool)

(assert start!40514)

(declare-fun b!446309 () Bool)

(declare-fun res!264963 () Bool)

(declare-fun e!262175 () Bool)

(assert (=> b!446309 (=> (not res!264963) (not e!262175))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!446309 (= res!264963 (validKeyInArray!0 k0!794))))

(declare-fun b!446310 () Bool)

(declare-fun e!262171 () Bool)

(declare-fun tp_is_empty!11893 () Bool)

(assert (=> b!446310 (= e!262171 tp_is_empty!11893)))

(declare-fun b!446311 () Bool)

(declare-fun e!262172 () Bool)

(assert (=> b!446311 (= e!262172 tp_is_empty!11893)))

(declare-fun b!446313 () Bool)

(declare-fun e!262174 () Bool)

(assert (=> b!446313 (= e!262174 false)))

(declare-fun lt!203596 () Bool)

(declare-datatypes ((array!27595 0))(
  ( (array!27596 (arr!13244 (Array (_ BitVec 32) (_ BitVec 64))) (size!13597 (_ BitVec 32))) )
))
(declare-fun lt!203597 () array!27595)

(declare-datatypes ((List!7928 0))(
  ( (Nil!7925) (Cons!7924 (h!8780 (_ BitVec 64)) (t!13679 List!7928)) )
))
(declare-fun arrayNoDuplicates!0 (array!27595 (_ BitVec 32) List!7928) Bool)

(assert (=> b!446313 (= lt!203596 (arrayNoDuplicates!0 lt!203597 #b00000000000000000000000000000000 Nil!7925))))

(declare-fun b!446314 () Bool)

(declare-fun res!264966 () Bool)

(assert (=> b!446314 (=> (not res!264966) (not e!262175))))

(declare-fun _keys!709 () array!27595)

(declare-fun arrayContainsKey!0 (array!27595 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!446314 (= res!264966 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!446315 () Bool)

(declare-fun res!264968 () Bool)

(assert (=> b!446315 (=> (not res!264968) (not e!262175))))

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!27595 (_ BitVec 32)) Bool)

(assert (=> b!446315 (= res!264968 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!446316 () Bool)

(declare-fun e!262176 () Bool)

(declare-fun mapRes!19470 () Bool)

(assert (=> b!446316 (= e!262176 (and e!262172 mapRes!19470))))

(declare-fun condMapEmpty!19470 () Bool)

(declare-datatypes ((V!16963 0))(
  ( (V!16964 (val!5991 Int)) )
))
(declare-datatypes ((ValueCell!5603 0))(
  ( (ValueCellFull!5603 (v!8240 V!16963)) (EmptyCell!5603) )
))
(declare-datatypes ((array!27597 0))(
  ( (array!27598 (arr!13245 (Array (_ BitVec 32) ValueCell!5603)) (size!13598 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!27597)

(declare-fun mapDefault!19470 () ValueCell!5603)

(assert (=> b!446316 (= condMapEmpty!19470 (= (arr!13245 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5603)) mapDefault!19470)))))

(declare-fun b!446317 () Bool)

(declare-fun res!264965 () Bool)

(assert (=> b!446317 (=> (not res!264965) (not e!262175))))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!446317 (= res!264965 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13597 _keys!709))))))

(declare-fun b!446318 () Bool)

(declare-fun res!264961 () Bool)

(assert (=> b!446318 (=> (not res!264961) (not e!262175))))

(assert (=> b!446318 (= res!264961 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7925))))

(declare-fun b!446319 () Bool)

(declare-fun res!264964 () Bool)

(assert (=> b!446319 (=> (not res!264964) (not e!262175))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(assert (=> b!446319 (= res!264964 (and (= (size!13598 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13597 _keys!709) (size!13598 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun res!264962 () Bool)

(assert (=> start!40514 (=> (not res!264962) (not e!262175))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> start!40514 (= res!264962 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13597 _keys!709))))))

(assert (=> start!40514 e!262175))

(assert (=> start!40514 true))

(declare-fun array_inv!9652 (array!27597) Bool)

(assert (=> start!40514 (and (array_inv!9652 _values!549) e!262176)))

(declare-fun array_inv!9653 (array!27595) Bool)

(assert (=> start!40514 (array_inv!9653 _keys!709)))

(declare-fun b!446312 () Bool)

(declare-fun res!264969 () Bool)

(assert (=> b!446312 (=> (not res!264969) (not e!262175))))

(assert (=> b!446312 (= res!264969 (or (= (select (arr!13244 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!13244 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun mapNonEmpty!19470 () Bool)

(declare-fun tp!37497 () Bool)

(assert (=> mapNonEmpty!19470 (= mapRes!19470 (and tp!37497 e!262171))))

(declare-fun mapRest!19470 () (Array (_ BitVec 32) ValueCell!5603))

(declare-fun mapKey!19470 () (_ BitVec 32))

(declare-fun mapValue!19470 () ValueCell!5603)

(assert (=> mapNonEmpty!19470 (= (arr!13245 _values!549) (store mapRest!19470 mapKey!19470 mapValue!19470))))

(declare-fun mapIsEmpty!19470 () Bool)

(assert (=> mapIsEmpty!19470 mapRes!19470))

(declare-fun b!446320 () Bool)

(assert (=> b!446320 (= e!262175 e!262174)))

(declare-fun res!264967 () Bool)

(assert (=> b!446320 (=> (not res!264967) (not e!262174))))

(assert (=> b!446320 (= res!264967 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!203597 mask!1025))))

(assert (=> b!446320 (= lt!203597 (array!27596 (store (arr!13244 _keys!709) i!563 k0!794) (size!13597 _keys!709)))))

(declare-fun b!446321 () Bool)

(declare-fun res!264960 () Bool)

(assert (=> b!446321 (=> (not res!264960) (not e!262175))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!446321 (= res!264960 (validMask!0 mask!1025))))

(assert (= (and start!40514 res!264962) b!446321))

(assert (= (and b!446321 res!264960) b!446319))

(assert (= (and b!446319 res!264964) b!446315))

(assert (= (and b!446315 res!264968) b!446318))

(assert (= (and b!446318 res!264961) b!446317))

(assert (= (and b!446317 res!264965) b!446309))

(assert (= (and b!446309 res!264963) b!446312))

(assert (= (and b!446312 res!264969) b!446314))

(assert (= (and b!446314 res!264966) b!446320))

(assert (= (and b!446320 res!264967) b!446313))

(assert (= (and b!446316 condMapEmpty!19470) mapIsEmpty!19470))

(assert (= (and b!446316 (not condMapEmpty!19470)) mapNonEmpty!19470))

(get-info :version)

(assert (= (and mapNonEmpty!19470 ((_ is ValueCellFull!5603) mapValue!19470)) b!446310))

(assert (= (and b!446316 ((_ is ValueCellFull!5603) mapDefault!19470)) b!446311))

(assert (= start!40514 b!446316))

(declare-fun m!431037 () Bool)

(assert (=> start!40514 m!431037))

(declare-fun m!431039 () Bool)

(assert (=> start!40514 m!431039))

(declare-fun m!431041 () Bool)

(assert (=> b!446312 m!431041))

(declare-fun m!431043 () Bool)

(assert (=> b!446320 m!431043))

(declare-fun m!431045 () Bool)

(assert (=> b!446320 m!431045))

(declare-fun m!431047 () Bool)

(assert (=> b!446313 m!431047))

(declare-fun m!431049 () Bool)

(assert (=> mapNonEmpty!19470 m!431049))

(declare-fun m!431051 () Bool)

(assert (=> b!446309 m!431051))

(declare-fun m!431053 () Bool)

(assert (=> b!446315 m!431053))

(declare-fun m!431055 () Bool)

(assert (=> b!446314 m!431055))

(declare-fun m!431057 () Bool)

(assert (=> b!446318 m!431057))

(declare-fun m!431059 () Bool)

(assert (=> b!446321 m!431059))

(check-sat (not mapNonEmpty!19470) tp_is_empty!11893 (not b!446318) (not b!446320) (not b!446315) (not b!446313) (not b!446314) (not start!40514) (not b!446321) (not b!446309))
(check-sat)
