; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!40462 () Bool)

(assert start!40462)

(declare-fun b!445360 () Bool)

(declare-fun res!264254 () Bool)

(declare-fun e!261796 () Bool)

(assert (=> b!445360 (=> (not res!264254) (not e!261796))))

(declare-datatypes ((array!27501 0))(
  ( (array!27502 (arr!13198 (Array (_ BitVec 32) (_ BitVec 64))) (size!13550 (_ BitVec 32))) )
))
(declare-fun lt!203627 () array!27501)

(declare-datatypes ((List!7889 0))(
  ( (Nil!7886) (Cons!7885 (h!8741 (_ BitVec 64)) (t!13647 List!7889)) )
))
(declare-fun arrayNoDuplicates!0 (array!27501 (_ BitVec 32) List!7889) Bool)

(assert (=> b!445360 (= res!264254 (arrayNoDuplicates!0 lt!203627 #b00000000000000000000000000000000 Nil!7886))))

(declare-fun b!445361 () Bool)

(declare-fun res!264247 () Bool)

(declare-fun e!261798 () Bool)

(assert (=> b!445361 (=> (not res!264247) (not e!261798))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!445361 (= res!264247 (validKeyInArray!0 k0!794))))

(declare-fun b!445362 () Bool)

(declare-fun e!261800 () Bool)

(declare-fun tp_is_empty!11847 () Bool)

(assert (=> b!445362 (= e!261800 tp_is_empty!11847)))

(declare-fun b!445363 () Bool)

(declare-fun res!264256 () Bool)

(assert (=> b!445363 (=> (not res!264256) (not e!261798))))

(declare-fun _keys!709 () array!27501)

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!445363 (= res!264256 (or (= (select (arr!13198 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!13198 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!445364 () Bool)

(declare-fun res!264249 () Bool)

(assert (=> b!445364 (=> (not res!264249) (not e!261798))))

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!445364 (= res!264249 (validMask!0 mask!1025))))

(declare-fun b!445365 () Bool)

(declare-fun from!863 () (_ BitVec 32))

(assert (=> b!445365 (= e!261796 (and (bvsgt from!863 i!563) (bvsle (bvadd #b00000000000000000000000000000001 from!863) (size!13550 _keys!709)) (bvsge (bvadd #b00000000000000000000000000000001 from!863) #b00000000000000000000000000000000) (bvsge (bvsub (size!13550 _keys!709) (bvadd #b00000000000000000000000000000001 from!863)) (bvsub (size!13550 _keys!709) from!863))))))

(declare-fun res!264253 () Bool)

(assert (=> start!40462 (=> (not res!264253) (not e!261798))))

(assert (=> start!40462 (= res!264253 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13550 _keys!709))))))

(assert (=> start!40462 e!261798))

(assert (=> start!40462 true))

(declare-datatypes ((V!16901 0))(
  ( (V!16902 (val!5968 Int)) )
))
(declare-datatypes ((ValueCell!5580 0))(
  ( (ValueCellFull!5580 (v!8219 V!16901)) (EmptyCell!5580) )
))
(declare-datatypes ((array!27503 0))(
  ( (array!27504 (arr!13199 (Array (_ BitVec 32) ValueCell!5580)) (size!13551 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!27503)

(declare-fun e!261795 () Bool)

(declare-fun array_inv!9568 (array!27503) Bool)

(assert (=> start!40462 (and (array_inv!9568 _values!549) e!261795)))

(declare-fun array_inv!9569 (array!27501) Bool)

(assert (=> start!40462 (array_inv!9569 _keys!709)))

(declare-fun mapIsEmpty!19398 () Bool)

(declare-fun mapRes!19398 () Bool)

(assert (=> mapIsEmpty!19398 mapRes!19398))

(declare-fun b!445366 () Bool)

(declare-fun res!264251 () Bool)

(assert (=> b!445366 (=> (not res!264251) (not e!261798))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(assert (=> b!445366 (= res!264251 (and (= (size!13551 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13550 _keys!709) (size!13551 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!445367 () Bool)

(assert (=> b!445367 (= e!261798 e!261796)))

(declare-fun res!264250 () Bool)

(assert (=> b!445367 (=> (not res!264250) (not e!261796))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!27501 (_ BitVec 32)) Bool)

(assert (=> b!445367 (= res!264250 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!203627 mask!1025))))

(assert (=> b!445367 (= lt!203627 (array!27502 (store (arr!13198 _keys!709) i!563 k0!794) (size!13550 _keys!709)))))

(declare-fun b!445368 () Bool)

(declare-fun res!264255 () Bool)

(assert (=> b!445368 (=> (not res!264255) (not e!261798))))

(declare-fun arrayContainsKey!0 (array!27501 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!445368 (= res!264255 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!445369 () Bool)

(declare-fun e!261799 () Bool)

(assert (=> b!445369 (= e!261795 (and e!261799 mapRes!19398))))

(declare-fun condMapEmpty!19398 () Bool)

(declare-fun mapDefault!19398 () ValueCell!5580)

(assert (=> b!445369 (= condMapEmpty!19398 (= (arr!13199 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5580)) mapDefault!19398)))))

(declare-fun b!445370 () Bool)

(declare-fun res!264248 () Bool)

(assert (=> b!445370 (=> (not res!264248) (not e!261798))))

(assert (=> b!445370 (= res!264248 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7886))))

(declare-fun mapNonEmpty!19398 () Bool)

(declare-fun tp!37380 () Bool)

(assert (=> mapNonEmpty!19398 (= mapRes!19398 (and tp!37380 e!261800))))

(declare-fun mapRest!19398 () (Array (_ BitVec 32) ValueCell!5580))

(declare-fun mapKey!19398 () (_ BitVec 32))

(declare-fun mapValue!19398 () ValueCell!5580)

(assert (=> mapNonEmpty!19398 (= (arr!13199 _values!549) (store mapRest!19398 mapKey!19398 mapValue!19398))))

(declare-fun b!445371 () Bool)

(declare-fun res!264252 () Bool)

(assert (=> b!445371 (=> (not res!264252) (not e!261798))))

(assert (=> b!445371 (= res!264252 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!445372 () Bool)

(declare-fun res!264246 () Bool)

(assert (=> b!445372 (=> (not res!264246) (not e!261798))))

(assert (=> b!445372 (= res!264246 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13550 _keys!709))))))

(declare-fun b!445373 () Bool)

(assert (=> b!445373 (= e!261799 tp_is_empty!11847)))

(assert (= (and start!40462 res!264253) b!445364))

(assert (= (and b!445364 res!264249) b!445366))

(assert (= (and b!445366 res!264251) b!445371))

(assert (= (and b!445371 res!264252) b!445370))

(assert (= (and b!445370 res!264248) b!445372))

(assert (= (and b!445372 res!264246) b!445361))

(assert (= (and b!445361 res!264247) b!445363))

(assert (= (and b!445363 res!264256) b!445368))

(assert (= (and b!445368 res!264255) b!445367))

(assert (= (and b!445367 res!264250) b!445360))

(assert (= (and b!445360 res!264254) b!445365))

(assert (= (and b!445369 condMapEmpty!19398) mapIsEmpty!19398))

(assert (= (and b!445369 (not condMapEmpty!19398)) mapNonEmpty!19398))

(get-info :version)

(assert (= (and mapNonEmpty!19398 ((_ is ValueCellFull!5580) mapValue!19398)) b!445362))

(assert (= (and b!445369 ((_ is ValueCellFull!5580) mapDefault!19398)) b!445373))

(assert (= start!40462 b!445369))

(declare-fun m!430885 () Bool)

(assert (=> mapNonEmpty!19398 m!430885))

(declare-fun m!430887 () Bool)

(assert (=> b!445364 m!430887))

(declare-fun m!430889 () Bool)

(assert (=> b!445363 m!430889))

(declare-fun m!430891 () Bool)

(assert (=> b!445371 m!430891))

(declare-fun m!430893 () Bool)

(assert (=> b!445367 m!430893))

(declare-fun m!430895 () Bool)

(assert (=> b!445367 m!430895))

(declare-fun m!430897 () Bool)

(assert (=> b!445360 m!430897))

(declare-fun m!430899 () Bool)

(assert (=> b!445370 m!430899))

(declare-fun m!430901 () Bool)

(assert (=> b!445368 m!430901))

(declare-fun m!430903 () Bool)

(assert (=> start!40462 m!430903))

(declare-fun m!430905 () Bool)

(assert (=> start!40462 m!430905))

(declare-fun m!430907 () Bool)

(assert (=> b!445361 m!430907))

(check-sat (not b!445367) tp_is_empty!11847 (not b!445360) (not b!445364) (not b!445368) (not b!445370) (not mapNonEmpty!19398) (not b!445361) (not b!445371) (not start!40462))
(check-sat)
