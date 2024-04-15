; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!40362 () Bool)

(assert start!40362)

(declare-fun b!443407 () Bool)

(declare-fun res!262824 () Bool)

(declare-fun e!260848 () Bool)

(assert (=> b!443407 (=> (not res!262824) (not e!260848))))

(declare-datatypes ((array!27335 0))(
  ( (array!27336 (arr!13115 (Array (_ BitVec 32) (_ BitVec 64))) (size!13468 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!27335)

(declare-datatypes ((List!7860 0))(
  ( (Nil!7857) (Cons!7856 (h!8712 (_ BitVec 64)) (t!13609 List!7860)) )
))
(declare-fun arrayNoDuplicates!0 (array!27335 (_ BitVec 32) List!7860) Bool)

(assert (=> b!443407 (= res!262824 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7857))))

(declare-fun mapNonEmpty!19269 () Bool)

(declare-fun mapRes!19269 () Bool)

(declare-fun tp!37251 () Bool)

(declare-fun e!260847 () Bool)

(assert (=> mapNonEmpty!19269 (= mapRes!19269 (and tp!37251 e!260847))))

(declare-datatypes ((V!16787 0))(
  ( (V!16788 (val!5925 Int)) )
))
(declare-datatypes ((ValueCell!5537 0))(
  ( (ValueCellFull!5537 (v!8170 V!16787)) (EmptyCell!5537) )
))
(declare-datatypes ((array!27337 0))(
  ( (array!27338 (arr!13116 (Array (_ BitVec 32) ValueCell!5537)) (size!13469 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!27337)

(declare-fun mapRest!19269 () (Array (_ BitVec 32) ValueCell!5537))

(declare-fun mapKey!19269 () (_ BitVec 32))

(declare-fun mapValue!19269 () ValueCell!5537)

(assert (=> mapNonEmpty!19269 (= (arr!13116 _values!549) (store mapRest!19269 mapKey!19269 mapValue!19269))))

(declare-fun b!443408 () Bool)

(declare-fun res!262823 () Bool)

(assert (=> b!443408 (=> (not res!262823) (not e!260848))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!27335 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!443408 (= res!262823 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!443409 () Bool)

(declare-fun tp_is_empty!11761 () Bool)

(assert (=> b!443409 (= e!260847 tp_is_empty!11761)))

(declare-fun b!443410 () Bool)

(declare-fun res!262825 () Bool)

(assert (=> b!443410 (=> (not res!262825) (not e!260848))))

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!27335 (_ BitVec 32)) Bool)

(assert (=> b!443410 (= res!262825 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!443411 () Bool)

(declare-fun res!262822 () Bool)

(assert (=> b!443411 (=> (not res!262822) (not e!260848))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!443411 (= res!262822 (validMask!0 mask!1025))))

(declare-fun b!443412 () Bool)

(declare-fun res!262827 () Bool)

(assert (=> b!443412 (=> (not res!262827) (not e!260848))))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!443412 (= res!262827 (or (= (select (arr!13115 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!13115 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun mapIsEmpty!19269 () Bool)

(assert (=> mapIsEmpty!19269 mapRes!19269))

(declare-fun b!443413 () Bool)

(declare-fun e!260850 () Bool)

(declare-fun e!260851 () Bool)

(assert (=> b!443413 (= e!260850 (and e!260851 mapRes!19269))))

(declare-fun condMapEmpty!19269 () Bool)

(declare-fun mapDefault!19269 () ValueCell!5537)

(assert (=> b!443413 (= condMapEmpty!19269 (= (arr!13116 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5537)) mapDefault!19269)))))

(declare-fun b!443414 () Bool)

(declare-fun res!262830 () Bool)

(assert (=> b!443414 (=> (not res!262830) (not e!260848))))

(assert (=> b!443414 (= res!262830 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13468 _keys!709))))))

(declare-fun b!443415 () Bool)

(declare-fun e!260849 () Bool)

(assert (=> b!443415 (= e!260848 e!260849)))

(declare-fun res!262829 () Bool)

(assert (=> b!443415 (=> (not res!262829) (not e!260849))))

(declare-fun lt!203141 () array!27335)

(assert (=> b!443415 (= res!262829 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!203141 mask!1025))))

(assert (=> b!443415 (= lt!203141 (array!27336 (store (arr!13115 _keys!709) i!563 k0!794) (size!13468 _keys!709)))))

(declare-fun b!443416 () Bool)

(declare-fun res!262828 () Bool)

(assert (=> b!443416 (=> (not res!262828) (not e!260848))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!443416 (= res!262828 (validKeyInArray!0 k0!794))))

(declare-fun b!443417 () Bool)

(assert (=> b!443417 (= e!260849 false)))

(declare-fun lt!203140 () Bool)

(assert (=> b!443417 (= lt!203140 (arrayNoDuplicates!0 lt!203141 #b00000000000000000000000000000000 Nil!7857))))

(declare-fun res!262831 () Bool)

(assert (=> start!40362 (=> (not res!262831) (not e!260848))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> start!40362 (= res!262831 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13468 _keys!709))))))

(assert (=> start!40362 e!260848))

(assert (=> start!40362 true))

(declare-fun array_inv!9562 (array!27337) Bool)

(assert (=> start!40362 (and (array_inv!9562 _values!549) e!260850)))

(declare-fun array_inv!9563 (array!27335) Bool)

(assert (=> start!40362 (array_inv!9563 _keys!709)))

(declare-fun b!443418 () Bool)

(declare-fun res!262826 () Bool)

(assert (=> b!443418 (=> (not res!262826) (not e!260848))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(assert (=> b!443418 (= res!262826 (and (= (size!13469 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13468 _keys!709) (size!13469 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!443419 () Bool)

(assert (=> b!443419 (= e!260851 tp_is_empty!11761)))

(assert (= (and start!40362 res!262831) b!443411))

(assert (= (and b!443411 res!262822) b!443418))

(assert (= (and b!443418 res!262826) b!443410))

(assert (= (and b!443410 res!262825) b!443407))

(assert (= (and b!443407 res!262824) b!443414))

(assert (= (and b!443414 res!262830) b!443416))

(assert (= (and b!443416 res!262828) b!443412))

(assert (= (and b!443412 res!262827) b!443408))

(assert (= (and b!443408 res!262823) b!443415))

(assert (= (and b!443415 res!262829) b!443417))

(assert (= (and b!443413 condMapEmpty!19269) mapIsEmpty!19269))

(assert (= (and b!443413 (not condMapEmpty!19269)) mapNonEmpty!19269))

(get-info :version)

(assert (= (and mapNonEmpty!19269 ((_ is ValueCellFull!5537) mapValue!19269)) b!443409))

(assert (= (and b!443413 ((_ is ValueCellFull!5537) mapDefault!19269)) b!443419))

(assert (= start!40362 b!443413))

(declare-fun m!429121 () Bool)

(assert (=> b!443410 m!429121))

(declare-fun m!429123 () Bool)

(assert (=> b!443411 m!429123))

(declare-fun m!429125 () Bool)

(assert (=> b!443416 m!429125))

(declare-fun m!429127 () Bool)

(assert (=> b!443417 m!429127))

(declare-fun m!429129 () Bool)

(assert (=> b!443412 m!429129))

(declare-fun m!429131 () Bool)

(assert (=> b!443408 m!429131))

(declare-fun m!429133 () Bool)

(assert (=> mapNonEmpty!19269 m!429133))

(declare-fun m!429135 () Bool)

(assert (=> start!40362 m!429135))

(declare-fun m!429137 () Bool)

(assert (=> start!40362 m!429137))

(declare-fun m!429139 () Bool)

(assert (=> b!443415 m!429139))

(declare-fun m!429141 () Bool)

(assert (=> b!443415 m!429141))

(declare-fun m!429143 () Bool)

(assert (=> b!443407 m!429143))

(check-sat (not b!443410) (not b!443416) (not mapNonEmpty!19269) (not b!443408) tp_is_empty!11761 (not start!40362) (not b!443407) (not b!443411) (not b!443415) (not b!443417))
(check-sat)
