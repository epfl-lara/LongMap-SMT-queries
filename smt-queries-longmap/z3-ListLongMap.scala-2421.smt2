; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!38256 () Bool)

(assert start!38256)

(declare-fun res!226258 () Bool)

(declare-fun e!238957 () Bool)

(assert (=> start!38256 (=> (not res!226258) (not e!238957))))

(declare-fun from!863 () (_ BitVec 32))

(declare-datatypes ((array!23435 0))(
  ( (array!23436 (arr!11174 (Array (_ BitVec 32) (_ BitVec 64))) (size!11526 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!23435)

(assert (=> start!38256 (= res!226258 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!11526 _keys!709))))))

(assert (=> start!38256 e!238957))

(assert (=> start!38256 true))

(declare-datatypes ((V!14125 0))(
  ( (V!14126 (val!4927 Int)) )
))
(declare-datatypes ((ValueCell!4539 0))(
  ( (ValueCellFull!4539 (v!7172 V!14125)) (EmptyCell!4539) )
))
(declare-datatypes ((array!23437 0))(
  ( (array!23438 (arr!11175 (Array (_ BitVec 32) ValueCell!4539)) (size!11527 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!23437)

(declare-fun e!238958 () Bool)

(declare-fun array_inv!8204 (array!23437) Bool)

(assert (=> start!38256 (and (array_inv!8204 _values!549) e!238958)))

(declare-fun array_inv!8205 (array!23435) Bool)

(assert (=> start!38256 (array_inv!8205 _keys!709)))

(declare-fun b!394721 () Bool)

(declare-fun res!226256 () Bool)

(assert (=> b!394721 (=> (not res!226256) (not e!238957))))

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!23435 (_ BitVec 32)) Bool)

(assert (=> b!394721 (= res!226256 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun mapNonEmpty!16248 () Bool)

(declare-fun mapRes!16248 () Bool)

(declare-fun tp!32043 () Bool)

(declare-fun e!238959 () Bool)

(assert (=> mapNonEmpty!16248 (= mapRes!16248 (and tp!32043 e!238959))))

(declare-fun mapValue!16248 () ValueCell!4539)

(declare-fun mapKey!16248 () (_ BitVec 32))

(declare-fun mapRest!16248 () (Array (_ BitVec 32) ValueCell!4539))

(assert (=> mapNonEmpty!16248 (= (arr!11175 _values!549) (store mapRest!16248 mapKey!16248 mapValue!16248))))

(declare-fun b!394722 () Bool)

(declare-fun e!238960 () Bool)

(assert (=> b!394722 (= e!238958 (and e!238960 mapRes!16248))))

(declare-fun condMapEmpty!16248 () Bool)

(declare-fun mapDefault!16248 () ValueCell!4539)

(assert (=> b!394722 (= condMapEmpty!16248 (= (arr!11175 _values!549) ((as const (Array (_ BitVec 32) ValueCell!4539)) mapDefault!16248)))))

(declare-fun b!394723 () Bool)

(declare-fun tp_is_empty!9765 () Bool)

(assert (=> b!394723 (= e!238959 tp_is_empty!9765)))

(declare-fun mapIsEmpty!16248 () Bool)

(assert (=> mapIsEmpty!16248 mapRes!16248))

(declare-fun b!394724 () Bool)

(declare-fun res!226259 () Bool)

(assert (=> b!394724 (=> (not res!226259) (not e!238957))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!394724 (= res!226259 (validMask!0 mask!1025))))

(declare-fun b!394725 () Bool)

(declare-fun res!226257 () Bool)

(assert (=> b!394725 (=> (not res!226257) (not e!238957))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(assert (=> b!394725 (= res!226257 (and (= (size!11527 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!11526 _keys!709) (size!11527 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!394726 () Bool)

(assert (=> b!394726 (= e!238960 tp_is_empty!9765)))

(declare-fun b!394727 () Bool)

(assert (=> b!394727 (= e!238957 (bvsgt #b00000000000000000000000000000000 (size!11526 _keys!709)))))

(assert (= (and start!38256 res!226258) b!394724))

(assert (= (and b!394724 res!226259) b!394725))

(assert (= (and b!394725 res!226257) b!394721))

(assert (= (and b!394721 res!226256) b!394727))

(assert (= (and b!394722 condMapEmpty!16248) mapIsEmpty!16248))

(assert (= (and b!394722 (not condMapEmpty!16248)) mapNonEmpty!16248))

(get-info :version)

(assert (= (and mapNonEmpty!16248 ((_ is ValueCellFull!4539) mapValue!16248)) b!394723))

(assert (= (and b!394722 ((_ is ValueCellFull!4539) mapDefault!16248)) b!394726))

(assert (= start!38256 b!394722))

(declare-fun m!391097 () Bool)

(assert (=> start!38256 m!391097))

(declare-fun m!391099 () Bool)

(assert (=> start!38256 m!391099))

(declare-fun m!391101 () Bool)

(assert (=> b!394721 m!391101))

(declare-fun m!391103 () Bool)

(assert (=> mapNonEmpty!16248 m!391103))

(declare-fun m!391105 () Bool)

(assert (=> b!394724 m!391105))

(check-sat (not b!394721) (not b!394724) (not start!38256) tp_is_empty!9765 (not mapNonEmpty!16248))
(check-sat)
