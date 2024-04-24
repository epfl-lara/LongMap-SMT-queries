; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!38978 () Bool)

(assert start!38978)

(declare-fun b!408487 () Bool)

(declare-fun res!236385 () Bool)

(declare-fun e!245175 () Bool)

(assert (=> b!408487 (=> (not res!236385) (not e!245175))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!408487 (= res!236385 (validKeyInArray!0 k0!794))))

(declare-fun b!408488 () Bool)

(declare-fun res!236391 () Bool)

(assert (=> b!408488 (=> (not res!236391) (not e!245175))))

(declare-datatypes ((array!24696 0))(
  ( (array!24697 (arr!11797 (Array (_ BitVec 32) (_ BitVec 64))) (size!12149 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!24696)

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!408488 (= res!236391 (or (= (select (arr!11797 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!11797 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun mapNonEmpty!17238 () Bool)

(declare-fun mapRes!17238 () Bool)

(declare-fun tp!33357 () Bool)

(declare-fun e!245171 () Bool)

(assert (=> mapNonEmpty!17238 (= mapRes!17238 (and tp!33357 e!245171))))

(declare-datatypes ((V!14987 0))(
  ( (V!14988 (val!5250 Int)) )
))
(declare-datatypes ((ValueCell!4862 0))(
  ( (ValueCellFull!4862 (v!7498 V!14987)) (EmptyCell!4862) )
))
(declare-fun mapRest!17238 () (Array (_ BitVec 32) ValueCell!4862))

(declare-datatypes ((array!24698 0))(
  ( (array!24699 (arr!11798 (Array (_ BitVec 32) ValueCell!4862)) (size!12150 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!24698)

(declare-fun mapKey!17238 () (_ BitVec 32))

(declare-fun mapValue!17238 () ValueCell!4862)

(assert (=> mapNonEmpty!17238 (= (arr!11798 _values!549) (store mapRest!17238 mapKey!17238 mapValue!17238))))

(declare-fun res!236386 () Bool)

(assert (=> start!38978 (=> (not res!236386) (not e!245175))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> start!38978 (= res!236386 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12149 _keys!709))))))

(assert (=> start!38978 e!245175))

(assert (=> start!38978 true))

(declare-fun e!245176 () Bool)

(declare-fun array_inv!8696 (array!24698) Bool)

(assert (=> start!38978 (and (array_inv!8696 _values!549) e!245176)))

(declare-fun array_inv!8697 (array!24696) Bool)

(assert (=> start!38978 (array_inv!8697 _keys!709)))

(declare-fun b!408489 () Bool)

(declare-fun e!245173 () Bool)

(assert (=> b!408489 (= e!245176 (and e!245173 mapRes!17238))))

(declare-fun condMapEmpty!17238 () Bool)

(declare-fun mapDefault!17238 () ValueCell!4862)

(assert (=> b!408489 (= condMapEmpty!17238 (= (arr!11798 _values!549) ((as const (Array (_ BitVec 32) ValueCell!4862)) mapDefault!17238)))))

(declare-fun b!408490 () Bool)

(declare-fun e!245172 () Bool)

(assert (=> b!408490 (= e!245172 false)))

(declare-fun lt!188832 () Bool)

(declare-fun lt!188831 () array!24696)

(declare-datatypes ((List!6711 0))(
  ( (Nil!6708) (Cons!6707 (h!7563 (_ BitVec 64)) (t!11877 List!6711)) )
))
(declare-fun arrayNoDuplicates!0 (array!24696 (_ BitVec 32) List!6711) Bool)

(assert (=> b!408490 (= lt!188832 (arrayNoDuplicates!0 lt!188831 #b00000000000000000000000000000000 Nil!6708))))

(declare-fun b!408491 () Bool)

(assert (=> b!408491 (= e!245175 e!245172)))

(declare-fun res!236389 () Bool)

(assert (=> b!408491 (=> (not res!236389) (not e!245172))))

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!24696 (_ BitVec 32)) Bool)

(assert (=> b!408491 (= res!236389 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!188831 mask!1025))))

(assert (=> b!408491 (= lt!188831 (array!24697 (store (arr!11797 _keys!709) i!563 k0!794) (size!12149 _keys!709)))))

(declare-fun b!408492 () Bool)

(declare-fun tp_is_empty!10411 () Bool)

(assert (=> b!408492 (= e!245171 tp_is_empty!10411)))

(declare-fun b!408493 () Bool)

(declare-fun res!236394 () Bool)

(assert (=> b!408493 (=> (not res!236394) (not e!245175))))

(assert (=> b!408493 (= res!236394 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12149 _keys!709))))))

(declare-fun b!408494 () Bool)

(declare-fun res!236392 () Bool)

(assert (=> b!408494 (=> (not res!236392) (not e!245175))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(assert (=> b!408494 (= res!236392 (and (= (size!12150 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12149 _keys!709) (size!12150 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!408495 () Bool)

(declare-fun res!236390 () Bool)

(assert (=> b!408495 (=> (not res!236390) (not e!245175))))

(declare-fun arrayContainsKey!0 (array!24696 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!408495 (= res!236390 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!408496 () Bool)

(assert (=> b!408496 (= e!245173 tp_is_empty!10411)))

(declare-fun b!408497 () Bool)

(declare-fun res!236393 () Bool)

(assert (=> b!408497 (=> (not res!236393) (not e!245175))))

(assert (=> b!408497 (= res!236393 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun mapIsEmpty!17238 () Bool)

(assert (=> mapIsEmpty!17238 mapRes!17238))

(declare-fun b!408498 () Bool)

(declare-fun res!236388 () Bool)

(assert (=> b!408498 (=> (not res!236388) (not e!245175))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!408498 (= res!236388 (validMask!0 mask!1025))))

(declare-fun b!408499 () Bool)

(declare-fun res!236387 () Bool)

(assert (=> b!408499 (=> (not res!236387) (not e!245175))))

(assert (=> b!408499 (= res!236387 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!6708))))

(assert (= (and start!38978 res!236386) b!408498))

(assert (= (and b!408498 res!236388) b!408494))

(assert (= (and b!408494 res!236392) b!408497))

(assert (= (and b!408497 res!236393) b!408499))

(assert (= (and b!408499 res!236387) b!408493))

(assert (= (and b!408493 res!236394) b!408487))

(assert (= (and b!408487 res!236385) b!408488))

(assert (= (and b!408488 res!236391) b!408495))

(assert (= (and b!408495 res!236390) b!408491))

(assert (= (and b!408491 res!236389) b!408490))

(assert (= (and b!408489 condMapEmpty!17238) mapIsEmpty!17238))

(assert (= (and b!408489 (not condMapEmpty!17238)) mapNonEmpty!17238))

(get-info :version)

(assert (= (and mapNonEmpty!17238 ((_ is ValueCellFull!4862) mapValue!17238)) b!408492))

(assert (= (and b!408489 ((_ is ValueCellFull!4862) mapDefault!17238)) b!408496))

(assert (= start!38978 b!408489))

(declare-fun m!400029 () Bool)

(assert (=> b!408499 m!400029))

(declare-fun m!400031 () Bool)

(assert (=> start!38978 m!400031))

(declare-fun m!400033 () Bool)

(assert (=> start!38978 m!400033))

(declare-fun m!400035 () Bool)

(assert (=> b!408495 m!400035))

(declare-fun m!400037 () Bool)

(assert (=> b!408490 m!400037))

(declare-fun m!400039 () Bool)

(assert (=> b!408498 m!400039))

(declare-fun m!400041 () Bool)

(assert (=> mapNonEmpty!17238 m!400041))

(declare-fun m!400043 () Bool)

(assert (=> b!408488 m!400043))

(declare-fun m!400045 () Bool)

(assert (=> b!408487 m!400045))

(declare-fun m!400047 () Bool)

(assert (=> b!408497 m!400047))

(declare-fun m!400049 () Bool)

(assert (=> b!408491 m!400049))

(declare-fun m!400051 () Bool)

(assert (=> b!408491 m!400051))

(check-sat (not b!408495) tp_is_empty!10411 (not b!408487) (not b!408498) (not b!408491) (not b!408490) (not mapNonEmpty!17238) (not b!408497) (not b!408499) (not start!38978))
(check-sat)
