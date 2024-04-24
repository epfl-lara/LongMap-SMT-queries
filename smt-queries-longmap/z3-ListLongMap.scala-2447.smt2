; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!38486 () Bool)

(assert start!38486)

(declare-fun b!397597 () Bool)

(declare-fun e!240421 () Bool)

(declare-fun tp_is_empty!9919 () Bool)

(assert (=> b!397597 (= e!240421 tp_is_empty!9919)))

(declare-fun b!397598 () Bool)

(declare-fun e!240424 () Bool)

(declare-fun e!240422 () Bool)

(assert (=> b!397598 (= e!240424 e!240422)))

(declare-fun res!228365 () Bool)

(assert (=> b!397598 (=> (not res!228365) (not e!240422))))

(declare-datatypes ((array!23736 0))(
  ( (array!23737 (arr!11317 (Array (_ BitVec 32) (_ BitVec 64))) (size!11669 (_ BitVec 32))) )
))
(declare-fun lt!187355 () array!23736)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!23736 (_ BitVec 32)) Bool)

(assert (=> b!397598 (= res!228365 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!187355 mask!1025))))

(declare-fun _keys!709 () array!23736)

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!397598 (= lt!187355 (array!23737 (store (arr!11317 _keys!709) i!563 k0!794) (size!11669 _keys!709)))))

(declare-fun b!397599 () Bool)

(declare-fun res!228362 () Bool)

(assert (=> b!397599 (=> (not res!228362) (not e!240424))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!397599 (= res!228362 (validMask!0 mask!1025))))

(declare-fun b!397600 () Bool)

(declare-fun e!240423 () Bool)

(assert (=> b!397600 (= e!240423 tp_is_empty!9919)))

(declare-fun b!397601 () Bool)

(declare-fun e!240420 () Bool)

(declare-fun mapRes!16500 () Bool)

(assert (=> b!397601 (= e!240420 (and e!240423 mapRes!16500))))

(declare-fun condMapEmpty!16500 () Bool)

(declare-datatypes ((V!14331 0))(
  ( (V!14332 (val!5004 Int)) )
))
(declare-datatypes ((ValueCell!4616 0))(
  ( (ValueCellFull!4616 (v!7252 V!14331)) (EmptyCell!4616) )
))
(declare-datatypes ((array!23738 0))(
  ( (array!23739 (arr!11318 (Array (_ BitVec 32) ValueCell!4616)) (size!11670 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!23738)

(declare-fun mapDefault!16500 () ValueCell!4616)

(assert (=> b!397601 (= condMapEmpty!16500 (= (arr!11318 _values!549) ((as const (Array (_ BitVec 32) ValueCell!4616)) mapDefault!16500)))))

(declare-fun b!397602 () Bool)

(assert (=> b!397602 (= e!240422 false)))

(declare-fun lt!187356 () Bool)

(declare-datatypes ((List!6418 0))(
  ( (Nil!6415) (Cons!6414 (h!7270 (_ BitVec 64)) (t!11584 List!6418)) )
))
(declare-fun arrayNoDuplicates!0 (array!23736 (_ BitVec 32) List!6418) Bool)

(assert (=> b!397602 (= lt!187356 (arrayNoDuplicates!0 lt!187355 #b00000000000000000000000000000000 Nil!6415))))

(declare-fun mapIsEmpty!16500 () Bool)

(assert (=> mapIsEmpty!16500 mapRes!16500))

(declare-fun b!397603 () Bool)

(declare-fun res!228359 () Bool)

(assert (=> b!397603 (=> (not res!228359) (not e!240424))))

(assert (=> b!397603 (= res!228359 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!11669 _keys!709))))))

(declare-fun b!397605 () Bool)

(declare-fun res!228364 () Bool)

(assert (=> b!397605 (=> (not res!228364) (not e!240424))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(assert (=> b!397605 (= res!228364 (and (= (size!11670 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!11669 _keys!709) (size!11670 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!397606 () Bool)

(declare-fun res!228366 () Bool)

(assert (=> b!397606 (=> (not res!228366) (not e!240424))))

(assert (=> b!397606 (= res!228366 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun mapNonEmpty!16500 () Bool)

(declare-fun tp!32295 () Bool)

(assert (=> mapNonEmpty!16500 (= mapRes!16500 (and tp!32295 e!240421))))

(declare-fun mapValue!16500 () ValueCell!4616)

(declare-fun mapRest!16500 () (Array (_ BitVec 32) ValueCell!4616))

(declare-fun mapKey!16500 () (_ BitVec 32))

(assert (=> mapNonEmpty!16500 (= (arr!11318 _values!549) (store mapRest!16500 mapKey!16500 mapValue!16500))))

(declare-fun res!228363 () Bool)

(assert (=> start!38486 (=> (not res!228363) (not e!240424))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> start!38486 (= res!228363 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!11669 _keys!709))))))

(assert (=> start!38486 e!240424))

(assert (=> start!38486 true))

(declare-fun array_inv!8362 (array!23738) Bool)

(assert (=> start!38486 (and (array_inv!8362 _values!549) e!240420)))

(declare-fun array_inv!8363 (array!23736) Bool)

(assert (=> start!38486 (array_inv!8363 _keys!709)))

(declare-fun b!397604 () Bool)

(declare-fun res!228361 () Bool)

(assert (=> b!397604 (=> (not res!228361) (not e!240424))))

(declare-fun arrayContainsKey!0 (array!23736 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!397604 (= res!228361 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!397607 () Bool)

(declare-fun res!228358 () Bool)

(assert (=> b!397607 (=> (not res!228358) (not e!240424))))

(assert (=> b!397607 (= res!228358 (or (= (select (arr!11317 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!11317 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!397608 () Bool)

(declare-fun res!228360 () Bool)

(assert (=> b!397608 (=> (not res!228360) (not e!240424))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!397608 (= res!228360 (validKeyInArray!0 k0!794))))

(declare-fun b!397609 () Bool)

(declare-fun res!228357 () Bool)

(assert (=> b!397609 (=> (not res!228357) (not e!240424))))

(assert (=> b!397609 (= res!228357 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!6415))))

(assert (= (and start!38486 res!228363) b!397599))

(assert (= (and b!397599 res!228362) b!397605))

(assert (= (and b!397605 res!228364) b!397606))

(assert (= (and b!397606 res!228366) b!397609))

(assert (= (and b!397609 res!228357) b!397603))

(assert (= (and b!397603 res!228359) b!397608))

(assert (= (and b!397608 res!228360) b!397607))

(assert (= (and b!397607 res!228358) b!397604))

(assert (= (and b!397604 res!228361) b!397598))

(assert (= (and b!397598 res!228365) b!397602))

(assert (= (and b!397601 condMapEmpty!16500) mapIsEmpty!16500))

(assert (= (and b!397601 (not condMapEmpty!16500)) mapNonEmpty!16500))

(get-info :version)

(assert (= (and mapNonEmpty!16500 ((_ is ValueCellFull!4616) mapValue!16500)) b!397597))

(assert (= (and b!397601 ((_ is ValueCellFull!4616) mapDefault!16500)) b!397600))

(assert (= start!38486 b!397601))

(declare-fun m!393045 () Bool)

(assert (=> start!38486 m!393045))

(declare-fun m!393047 () Bool)

(assert (=> start!38486 m!393047))

(declare-fun m!393049 () Bool)

(assert (=> b!397608 m!393049))

(declare-fun m!393051 () Bool)

(assert (=> b!397604 m!393051))

(declare-fun m!393053 () Bool)

(assert (=> mapNonEmpty!16500 m!393053))

(declare-fun m!393055 () Bool)

(assert (=> b!397599 m!393055))

(declare-fun m!393057 () Bool)

(assert (=> b!397598 m!393057))

(declare-fun m!393059 () Bool)

(assert (=> b!397598 m!393059))

(declare-fun m!393061 () Bool)

(assert (=> b!397606 m!393061))

(declare-fun m!393063 () Bool)

(assert (=> b!397607 m!393063))

(declare-fun m!393065 () Bool)

(assert (=> b!397602 m!393065))

(declare-fun m!393067 () Bool)

(assert (=> b!397609 m!393067))

(check-sat (not mapNonEmpty!16500) (not b!397598) (not b!397604) (not b!397608) tp_is_empty!9919 (not b!397606) (not b!397602) (not b!397599) (not start!38486) (not b!397609))
(check-sat)
