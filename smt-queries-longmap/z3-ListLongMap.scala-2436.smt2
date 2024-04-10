; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!38436 () Bool)

(assert start!38436)

(declare-fun b!396398 () Bool)

(declare-fun res!227401 () Bool)

(declare-fun e!239880 () Bool)

(assert (=> b!396398 (=> (not res!227401) (not e!239880))))

(declare-datatypes ((array!23623 0))(
  ( (array!23624 (arr!11261 (Array (_ BitVec 32) (_ BitVec 64))) (size!11613 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!23623)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((V!14245 0))(
  ( (V!14246 (val!4972 Int)) )
))
(declare-datatypes ((ValueCell!4584 0))(
  ( (ValueCellFull!4584 (v!7219 V!14245)) (EmptyCell!4584) )
))
(declare-datatypes ((array!23625 0))(
  ( (array!23626 (arr!11262 (Array (_ BitVec 32) ValueCell!4584)) (size!11614 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!23625)

(declare-fun mask!1025 () (_ BitVec 32))

(assert (=> b!396398 (= res!227401 (and (= (size!11614 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!11613 _keys!709) (size!11614 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!16404 () Bool)

(declare-fun mapRes!16404 () Bool)

(declare-fun tp!32199 () Bool)

(declare-fun e!239877 () Bool)

(assert (=> mapNonEmpty!16404 (= mapRes!16404 (and tp!32199 e!239877))))

(declare-fun mapValue!16404 () ValueCell!4584)

(declare-fun mapKey!16404 () (_ BitVec 32))

(declare-fun mapRest!16404 () (Array (_ BitVec 32) ValueCell!4584))

(assert (=> mapNonEmpty!16404 (= (arr!11262 _values!549) (store mapRest!16404 mapKey!16404 mapValue!16404))))

(declare-fun b!396399 () Bool)

(declare-fun res!227403 () Bool)

(assert (=> b!396399 (=> (not res!227403) (not e!239880))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!396399 (= res!227403 (validKeyInArray!0 k0!794))))

(declare-fun b!396400 () Bool)

(declare-fun res!227405 () Bool)

(assert (=> b!396400 (=> (not res!227405) (not e!239880))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!23623 (_ BitVec 32)) Bool)

(assert (=> b!396400 (= res!227405 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!396401 () Bool)

(declare-fun e!239876 () Bool)

(declare-fun e!239879 () Bool)

(assert (=> b!396401 (= e!239876 (and e!239879 mapRes!16404))))

(declare-fun condMapEmpty!16404 () Bool)

(declare-fun mapDefault!16404 () ValueCell!4584)

(assert (=> b!396401 (= condMapEmpty!16404 (= (arr!11262 _values!549) ((as const (Array (_ BitVec 32) ValueCell!4584)) mapDefault!16404)))))

(declare-fun b!396402 () Bool)

(declare-fun res!227404 () Bool)

(assert (=> b!396402 (=> (not res!227404) (not e!239880))))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!396402 (= res!227404 (or (= (select (arr!11261 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!11261 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!227409 () Bool)

(assert (=> start!38436 (=> (not res!227409) (not e!239880))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> start!38436 (= res!227409 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!11613 _keys!709))))))

(assert (=> start!38436 e!239880))

(assert (=> start!38436 true))

(declare-fun array_inv!8262 (array!23625) Bool)

(assert (=> start!38436 (and (array_inv!8262 _values!549) e!239876)))

(declare-fun array_inv!8263 (array!23623) Bool)

(assert (=> start!38436 (array_inv!8263 _keys!709)))

(declare-fun b!396403 () Bool)

(declare-fun e!239878 () Bool)

(assert (=> b!396403 (= e!239880 e!239878)))

(declare-fun res!227400 () Bool)

(assert (=> b!396403 (=> (not res!227400) (not e!239878))))

(declare-fun lt!187145 () array!23623)

(assert (=> b!396403 (= res!227400 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!187145 mask!1025))))

(assert (=> b!396403 (= lt!187145 (array!23624 (store (arr!11261 _keys!709) i!563 k0!794) (size!11613 _keys!709)))))

(declare-fun b!396404 () Bool)

(declare-fun tp_is_empty!9855 () Bool)

(assert (=> b!396404 (= e!239879 tp_is_empty!9855)))

(declare-fun b!396405 () Bool)

(assert (=> b!396405 (= e!239878 false)))

(declare-fun lt!187144 () Bool)

(declare-datatypes ((List!6525 0))(
  ( (Nil!6522) (Cons!6521 (h!7377 (_ BitVec 64)) (t!11699 List!6525)) )
))
(declare-fun arrayNoDuplicates!0 (array!23623 (_ BitVec 32) List!6525) Bool)

(assert (=> b!396405 (= lt!187144 (arrayNoDuplicates!0 lt!187145 #b00000000000000000000000000000000 Nil!6522))))

(declare-fun b!396406 () Bool)

(declare-fun res!227407 () Bool)

(assert (=> b!396406 (=> (not res!227407) (not e!239880))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!396406 (= res!227407 (validMask!0 mask!1025))))

(declare-fun b!396407 () Bool)

(declare-fun res!227406 () Bool)

(assert (=> b!396407 (=> (not res!227406) (not e!239880))))

(assert (=> b!396407 (= res!227406 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!11613 _keys!709))))))

(declare-fun b!396408 () Bool)

(assert (=> b!396408 (= e!239877 tp_is_empty!9855)))

(declare-fun b!396409 () Bool)

(declare-fun res!227402 () Bool)

(assert (=> b!396409 (=> (not res!227402) (not e!239880))))

(declare-fun arrayContainsKey!0 (array!23623 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!396409 (= res!227402 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!396410 () Bool)

(declare-fun res!227408 () Bool)

(assert (=> b!396410 (=> (not res!227408) (not e!239880))))

(assert (=> b!396410 (= res!227408 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!6522))))

(declare-fun mapIsEmpty!16404 () Bool)

(assert (=> mapIsEmpty!16404 mapRes!16404))

(assert (= (and start!38436 res!227409) b!396406))

(assert (= (and b!396406 res!227407) b!396398))

(assert (= (and b!396398 res!227401) b!396400))

(assert (= (and b!396400 res!227405) b!396410))

(assert (= (and b!396410 res!227408) b!396407))

(assert (= (and b!396407 res!227406) b!396399))

(assert (= (and b!396399 res!227403) b!396402))

(assert (= (and b!396402 res!227404) b!396409))

(assert (= (and b!396409 res!227402) b!396403))

(assert (= (and b!396403 res!227400) b!396405))

(assert (= (and b!396401 condMapEmpty!16404) mapIsEmpty!16404))

(assert (= (and b!396401 (not condMapEmpty!16404)) mapNonEmpty!16404))

(get-info :version)

(assert (= (and mapNonEmpty!16404 ((_ is ValueCellFull!4584) mapValue!16404)) b!396408))

(assert (= (and b!396401 ((_ is ValueCellFull!4584) mapDefault!16404)) b!396404))

(assert (= start!38436 b!396401))

(declare-fun m!392047 () Bool)

(assert (=> b!396400 m!392047))

(declare-fun m!392049 () Bool)

(assert (=> b!396410 m!392049))

(declare-fun m!392051 () Bool)

(assert (=> mapNonEmpty!16404 m!392051))

(declare-fun m!392053 () Bool)

(assert (=> b!396399 m!392053))

(declare-fun m!392055 () Bool)

(assert (=> start!38436 m!392055))

(declare-fun m!392057 () Bool)

(assert (=> start!38436 m!392057))

(declare-fun m!392059 () Bool)

(assert (=> b!396409 m!392059))

(declare-fun m!392061 () Bool)

(assert (=> b!396405 m!392061))

(declare-fun m!392063 () Bool)

(assert (=> b!396406 m!392063))

(declare-fun m!392065 () Bool)

(assert (=> b!396403 m!392065))

(declare-fun m!392067 () Bool)

(assert (=> b!396403 m!392067))

(declare-fun m!392069 () Bool)

(assert (=> b!396402 m!392069))

(check-sat (not b!396403) (not b!396409) (not b!396400) (not b!396410) (not mapNonEmpty!16404) tp_is_empty!9855 (not b!396405) (not start!38436) (not b!396406) (not b!396399))
(check-sat)
