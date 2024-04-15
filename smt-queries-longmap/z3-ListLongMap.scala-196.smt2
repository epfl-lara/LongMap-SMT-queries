; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!3786 () Bool)

(assert start!3786)

(declare-fun b!26504 () Bool)

(declare-fun e!17280 () Bool)

(assert (=> b!26504 (= e!17280 false)))

(declare-fun lt!10381 () Bool)

(declare-datatypes ((array!1453 0))(
  ( (array!1454 (arr!684 (Array (_ BitVec 32) (_ BitVec 64))) (size!785 (_ BitVec 32))) )
))
(declare-fun _keys!1833 () array!1453)

(declare-datatypes ((List!590 0))(
  ( (Nil!587) (Cons!586 (h!1153 (_ BitVec 64)) (t!3270 List!590)) )
))
(declare-fun arrayNoDuplicates!0 (array!1453 (_ BitVec 32) List!590) Bool)

(assert (=> b!26504 (= lt!10381 (arrayNoDuplicates!0 _keys!1833 #b00000000000000000000000000000000 Nil!587))))

(declare-fun mapNonEmpty!1192 () Bool)

(declare-fun mapRes!1192 () Bool)

(declare-fun tp!3712 () Bool)

(declare-fun e!17277 () Bool)

(assert (=> mapNonEmpty!1192 (= mapRes!1192 (and tp!3712 e!17277))))

(declare-fun mapKey!1192 () (_ BitVec 32))

(declare-datatypes ((V!1315 0))(
  ( (V!1316 (val!585 Int)) )
))
(declare-datatypes ((ValueCell!359 0))(
  ( (ValueCellFull!359 (v!1670 V!1315)) (EmptyCell!359) )
))
(declare-datatypes ((array!1455 0))(
  ( (array!1456 (arr!685 (Array (_ BitVec 32) ValueCell!359)) (size!786 (_ BitVec 32))) )
))
(declare-fun _values!1501 () array!1455)

(declare-fun mapValue!1192 () ValueCell!359)

(declare-fun mapRest!1192 () (Array (_ BitVec 32) ValueCell!359))

(assert (=> mapNonEmpty!1192 (= (arr!685 _values!1501) (store mapRest!1192 mapKey!1192 mapValue!1192))))

(declare-fun b!26505 () Bool)

(declare-fun res!15723 () Bool)

(assert (=> b!26505 (=> (not res!15723) (not e!17280))))

(declare-fun extraKeys!1422 () (_ BitVec 32))

(declare-fun mask!2294 () (_ BitVec 32))

(assert (=> b!26505 (= res!15723 (and (= (size!786 _values!1501) (bvadd #b00000000000000000000000000000001 mask!2294)) (= (size!785 _keys!1833) (size!786 _values!1501)) (bvsge mask!2294 #b00000000000000000000000000000000) (bvsge extraKeys!1422 #b00000000000000000000000000000000) (bvsle extraKeys!1422 #b00000000000000000000000000000011)))))

(declare-fun res!15722 () Bool)

(assert (=> start!3786 (=> (not res!15722) (not e!17280))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!3786 (= res!15722 (validMask!0 mask!2294))))

(assert (=> start!3786 e!17280))

(assert (=> start!3786 true))

(declare-fun e!17278 () Bool)

(declare-fun array_inv!485 (array!1455) Bool)

(assert (=> start!3786 (and (array_inv!485 _values!1501) e!17278)))

(declare-fun array_inv!486 (array!1453) Bool)

(assert (=> start!3786 (array_inv!486 _keys!1833)))

(declare-fun mapIsEmpty!1192 () Bool)

(assert (=> mapIsEmpty!1192 mapRes!1192))

(declare-fun b!26506 () Bool)

(declare-fun e!17279 () Bool)

(assert (=> b!26506 (= e!17278 (and e!17279 mapRes!1192))))

(declare-fun condMapEmpty!1192 () Bool)

(declare-fun mapDefault!1192 () ValueCell!359)

(assert (=> b!26506 (= condMapEmpty!1192 (= (arr!685 _values!1501) ((as const (Array (_ BitVec 32) ValueCell!359)) mapDefault!1192)))))

(declare-fun b!26507 () Bool)

(declare-fun tp_is_empty!1117 () Bool)

(assert (=> b!26507 (= e!17277 tp_is_empty!1117)))

(declare-fun b!26508 () Bool)

(declare-fun res!15724 () Bool)

(assert (=> b!26508 (=> (not res!15724) (not e!17280))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!1453 (_ BitVec 32)) Bool)

(assert (=> b!26508 (= res!15724 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1833 mask!2294))))

(declare-fun b!26509 () Bool)

(assert (=> b!26509 (= e!17279 tp_is_empty!1117)))

(assert (= (and start!3786 res!15722) b!26505))

(assert (= (and b!26505 res!15723) b!26508))

(assert (= (and b!26508 res!15724) b!26504))

(assert (= (and b!26506 condMapEmpty!1192) mapIsEmpty!1192))

(assert (= (and b!26506 (not condMapEmpty!1192)) mapNonEmpty!1192))

(get-info :version)

(assert (= (and mapNonEmpty!1192 ((_ is ValueCellFull!359) mapValue!1192)) b!26507))

(assert (= (and b!26506 ((_ is ValueCellFull!359) mapDefault!1192)) b!26509))

(assert (= start!3786 b!26506))

(declare-fun m!21223 () Bool)

(assert (=> b!26504 m!21223))

(declare-fun m!21225 () Bool)

(assert (=> mapNonEmpty!1192 m!21225))

(declare-fun m!21227 () Bool)

(assert (=> start!3786 m!21227))

(declare-fun m!21229 () Bool)

(assert (=> start!3786 m!21229))

(declare-fun m!21231 () Bool)

(assert (=> start!3786 m!21231))

(declare-fun m!21233 () Bool)

(assert (=> b!26508 m!21233))

(check-sat (not b!26508) tp_is_empty!1117 (not start!3786) (not mapNonEmpty!1192) (not b!26504))
(check-sat)
