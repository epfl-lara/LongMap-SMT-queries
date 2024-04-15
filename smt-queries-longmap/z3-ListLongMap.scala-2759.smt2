; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!40392 () Bool)

(assert start!40392)

(declare-fun res!263278 () Bool)

(declare-fun e!261119 () Bool)

(assert (=> start!40392 (=> (not res!263278) (not e!261119))))

(declare-fun from!863 () (_ BitVec 32))

(declare-datatypes ((array!27395 0))(
  ( (array!27396 (arr!13145 (Array (_ BitVec 32) (_ BitVec 64))) (size!13498 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!27395)

(assert (=> start!40392 (= res!263278 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13498 _keys!709))))))

(assert (=> start!40392 e!261119))

(assert (=> start!40392 true))

(declare-datatypes ((V!16827 0))(
  ( (V!16828 (val!5940 Int)) )
))
(declare-datatypes ((ValueCell!5552 0))(
  ( (ValueCellFull!5552 (v!8185 V!16827)) (EmptyCell!5552) )
))
(declare-datatypes ((array!27397 0))(
  ( (array!27398 (arr!13146 (Array (_ BitVec 32) ValueCell!5552)) (size!13499 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!27397)

(declare-fun e!261117 () Bool)

(declare-fun array_inv!9584 (array!27397) Bool)

(assert (=> start!40392 (and (array_inv!9584 _values!549) e!261117)))

(declare-fun array_inv!9585 (array!27395) Bool)

(assert (=> start!40392 (array_inv!9585 _keys!709)))

(declare-fun b!443992 () Bool)

(declare-fun e!261121 () Bool)

(declare-fun tp_is_empty!11791 () Bool)

(assert (=> b!443992 (= e!261121 tp_is_empty!11791)))

(declare-fun b!443993 () Bool)

(declare-fun res!263280 () Bool)

(assert (=> b!443993 (=> (not res!263280) (not e!261119))))

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!443993 (= res!263280 (validMask!0 mask!1025))))

(declare-fun b!443994 () Bool)

(declare-fun res!263272 () Bool)

(assert (=> b!443994 (=> (not res!263272) (not e!261119))))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!443994 (= res!263272 (or (= (select (arr!13145 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!13145 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!443995 () Bool)

(declare-fun e!261122 () Bool)

(assert (=> b!443995 (= e!261119 e!261122)))

(declare-fun res!263274 () Bool)

(assert (=> b!443995 (=> (not res!263274) (not e!261122))))

(declare-fun lt!203230 () array!27395)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!27395 (_ BitVec 32)) Bool)

(assert (=> b!443995 (= res!263274 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!203230 mask!1025))))

(declare-fun k0!794 () (_ BitVec 64))

(assert (=> b!443995 (= lt!203230 (array!27396 (store (arr!13145 _keys!709) i!563 k0!794) (size!13498 _keys!709)))))

(declare-fun b!443996 () Bool)

(assert (=> b!443996 (= e!261122 false)))

(declare-fun lt!203231 () Bool)

(declare-datatypes ((List!7872 0))(
  ( (Nil!7869) (Cons!7868 (h!8724 (_ BitVec 64)) (t!13621 List!7872)) )
))
(declare-fun arrayNoDuplicates!0 (array!27395 (_ BitVec 32) List!7872) Bool)

(assert (=> b!443996 (= lt!203231 (arrayNoDuplicates!0 lt!203230 #b00000000000000000000000000000000 Nil!7869))))

(declare-fun b!443997 () Bool)

(declare-fun res!263275 () Bool)

(assert (=> b!443997 (=> (not res!263275) (not e!261119))))

(assert (=> b!443997 (= res!263275 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13498 _keys!709))))))

(declare-fun mapIsEmpty!19314 () Bool)

(declare-fun mapRes!19314 () Bool)

(assert (=> mapIsEmpty!19314 mapRes!19314))

(declare-fun b!443998 () Bool)

(declare-fun res!263273 () Bool)

(assert (=> b!443998 (=> (not res!263273) (not e!261119))))

(assert (=> b!443998 (= res!263273 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!443999 () Bool)

(declare-fun res!263276 () Bool)

(assert (=> b!443999 (=> (not res!263276) (not e!261119))))

(declare-fun arrayContainsKey!0 (array!27395 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!443999 (= res!263276 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!444000 () Bool)

(declare-fun e!261120 () Bool)

(assert (=> b!444000 (= e!261120 tp_is_empty!11791)))

(declare-fun b!444001 () Bool)

(assert (=> b!444001 (= e!261117 (and e!261121 mapRes!19314))))

(declare-fun condMapEmpty!19314 () Bool)

(declare-fun mapDefault!19314 () ValueCell!5552)

(assert (=> b!444001 (= condMapEmpty!19314 (= (arr!13146 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5552)) mapDefault!19314)))))

(declare-fun b!444002 () Bool)

(declare-fun res!263281 () Bool)

(assert (=> b!444002 (=> (not res!263281) (not e!261119))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!444002 (= res!263281 (validKeyInArray!0 k0!794))))

(declare-fun mapNonEmpty!19314 () Bool)

(declare-fun tp!37296 () Bool)

(assert (=> mapNonEmpty!19314 (= mapRes!19314 (and tp!37296 e!261120))))

(declare-fun mapRest!19314 () (Array (_ BitVec 32) ValueCell!5552))

(declare-fun mapKey!19314 () (_ BitVec 32))

(declare-fun mapValue!19314 () ValueCell!5552)

(assert (=> mapNonEmpty!19314 (= (arr!13146 _values!549) (store mapRest!19314 mapKey!19314 mapValue!19314))))

(declare-fun b!444003 () Bool)

(declare-fun res!263277 () Bool)

(assert (=> b!444003 (=> (not res!263277) (not e!261119))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(assert (=> b!444003 (= res!263277 (and (= (size!13499 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13498 _keys!709) (size!13499 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!444004 () Bool)

(declare-fun res!263279 () Bool)

(assert (=> b!444004 (=> (not res!263279) (not e!261119))))

(assert (=> b!444004 (= res!263279 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7869))))

(assert (= (and start!40392 res!263278) b!443993))

(assert (= (and b!443993 res!263280) b!444003))

(assert (= (and b!444003 res!263277) b!443998))

(assert (= (and b!443998 res!263273) b!444004))

(assert (= (and b!444004 res!263279) b!443997))

(assert (= (and b!443997 res!263275) b!444002))

(assert (= (and b!444002 res!263281) b!443994))

(assert (= (and b!443994 res!263272) b!443999))

(assert (= (and b!443999 res!263276) b!443995))

(assert (= (and b!443995 res!263274) b!443996))

(assert (= (and b!444001 condMapEmpty!19314) mapIsEmpty!19314))

(assert (= (and b!444001 (not condMapEmpty!19314)) mapNonEmpty!19314))

(get-info :version)

(assert (= (and mapNonEmpty!19314 ((_ is ValueCellFull!5552) mapValue!19314)) b!444000))

(assert (= (and b!444001 ((_ is ValueCellFull!5552) mapDefault!19314)) b!443992))

(assert (= start!40392 b!444001))

(declare-fun m!429481 () Bool)

(assert (=> b!443995 m!429481))

(declare-fun m!429483 () Bool)

(assert (=> b!443995 m!429483))

(declare-fun m!429485 () Bool)

(assert (=> b!444004 m!429485))

(declare-fun m!429487 () Bool)

(assert (=> b!443994 m!429487))

(declare-fun m!429489 () Bool)

(assert (=> b!443998 m!429489))

(declare-fun m!429491 () Bool)

(assert (=> b!443993 m!429491))

(declare-fun m!429493 () Bool)

(assert (=> b!443999 m!429493))

(declare-fun m!429495 () Bool)

(assert (=> b!443996 m!429495))

(declare-fun m!429497 () Bool)

(assert (=> b!444002 m!429497))

(declare-fun m!429499 () Bool)

(assert (=> mapNonEmpty!19314 m!429499))

(declare-fun m!429501 () Bool)

(assert (=> start!40392 m!429501))

(declare-fun m!429503 () Bool)

(assert (=> start!40392 m!429503))

(check-sat (not b!443996) (not b!444002) (not b!443995) (not start!40392) (not b!443999) (not b!443993) (not mapNonEmpty!19314) (not b!443998) (not b!444004) tp_is_empty!11791)
(check-sat)
