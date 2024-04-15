; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!40870 () Bool)

(assert start!40870)

(declare-fun b_free!10819 () Bool)

(declare-fun b_next!10819 () Bool)

(assert (=> start!40870 (= b_free!10819 (not b_next!10819))))

(declare-fun tp!38284 () Bool)

(declare-fun b_and!18935 () Bool)

(assert (=> start!40870 (= tp!38284 b_and!18935)))

(declare-fun res!270334 () Bool)

(declare-fun e!265552 () Bool)

(assert (=> start!40870 (=> (not res!270334) (not e!265552))))

(declare-fun from!863 () (_ BitVec 32))

(declare-datatypes ((array!28111 0))(
  ( (array!28112 (arr!13499 (Array (_ BitVec 32) (_ BitVec 64))) (size!13852 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!28111)

(assert (=> start!40870 (= res!270334 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13852 _keys!709))))))

(assert (=> start!40870 e!265552))

(declare-fun tp_is_empty!12157 () Bool)

(assert (=> start!40870 tp_is_empty!12157))

(assert (=> start!40870 tp!38284))

(assert (=> start!40870 true))

(declare-datatypes ((V!17315 0))(
  ( (V!17316 (val!6123 Int)) )
))
(declare-datatypes ((ValueCell!5735 0))(
  ( (ValueCellFull!5735 (v!8383 V!17315)) (EmptyCell!5735) )
))
(declare-datatypes ((array!28113 0))(
  ( (array!28114 (arr!13500 (Array (_ BitVec 32) ValueCell!5735)) (size!13853 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!28113)

(declare-fun e!265550 () Bool)

(declare-fun array_inv!9838 (array!28113) Bool)

(assert (=> start!40870 (and (array_inv!9838 _values!549) e!265550)))

(declare-fun array_inv!9839 (array!28111) Bool)

(assert (=> start!40870 (array_inv!9839 _keys!709)))

(declare-fun b!453781 () Bool)

(declare-fun res!270336 () Bool)

(assert (=> b!453781 (=> (not res!270336) (not e!265552))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!28111 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!453781 (= res!270336 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!453782 () Bool)

(declare-fun e!265551 () Bool)

(assert (=> b!453782 (= e!265551 tp_is_empty!12157)))

(declare-fun b!453783 () Bool)

(declare-fun res!270328 () Bool)

(declare-fun e!265554 () Bool)

(assert (=> b!453783 (=> (not res!270328) (not e!265554))))

(declare-fun lt!205824 () array!28111)

(declare-datatypes ((List!8134 0))(
  ( (Nil!8131) (Cons!8130 (h!8986 (_ BitVec 64)) (t!13953 List!8134)) )
))
(declare-fun arrayNoDuplicates!0 (array!28111 (_ BitVec 32) List!8134) Bool)

(assert (=> b!453783 (= res!270328 (arrayNoDuplicates!0 lt!205824 #b00000000000000000000000000000000 Nil!8131))))

(declare-fun b!453784 () Bool)

(declare-fun res!270330 () Bool)

(assert (=> b!453784 (=> (not res!270330) (not e!265552))))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!453784 (= res!270330 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13852 _keys!709))))))

(declare-fun b!453785 () Bool)

(declare-fun res!270338 () Bool)

(assert (=> b!453785 (=> (not res!270338) (not e!265554))))

(assert (=> b!453785 (= res!270338 (bvsle from!863 i!563))))

(declare-fun mapIsEmpty!19876 () Bool)

(declare-fun mapRes!19876 () Bool)

(assert (=> mapIsEmpty!19876 mapRes!19876))

(declare-fun b!453786 () Bool)

(declare-fun res!270337 () Bool)

(assert (=> b!453786 (=> (not res!270337) (not e!265552))))

(assert (=> b!453786 (= res!270337 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!8131))))

(declare-fun b!453787 () Bool)

(assert (=> b!453787 (= e!265552 e!265554)))

(declare-fun res!270335 () Bool)

(assert (=> b!453787 (=> (not res!270335) (not e!265554))))

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!28111 (_ BitVec 32)) Bool)

(assert (=> b!453787 (= res!270335 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!205824 mask!1025))))

(assert (=> b!453787 (= lt!205824 (array!28112 (store (arr!13499 _keys!709) i!563 k0!794) (size!13852 _keys!709)))))

(declare-fun b!453788 () Bool)

(declare-fun res!270327 () Bool)

(assert (=> b!453788 (=> (not res!270327) (not e!265552))))

(assert (=> b!453788 (= res!270327 (or (= (select (arr!13499 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!13499 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!453789 () Bool)

(declare-fun res!270333 () Bool)

(assert (=> b!453789 (=> (not res!270333) (not e!265552))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(assert (=> b!453789 (= res!270333 (and (= (size!13853 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13852 _keys!709) (size!13853 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!453790 () Bool)

(declare-fun res!270331 () Bool)

(assert (=> b!453790 (=> (not res!270331) (not e!265552))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!453790 (= res!270331 (validKeyInArray!0 k0!794))))

(declare-fun b!453791 () Bool)

(assert (=> b!453791 (= e!265550 (and e!265551 mapRes!19876))))

(declare-fun condMapEmpty!19876 () Bool)

(declare-fun mapDefault!19876 () ValueCell!5735)

(assert (=> b!453791 (= condMapEmpty!19876 (= (arr!13500 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5735)) mapDefault!19876)))))

(declare-fun b!453792 () Bool)

(declare-fun e!265555 () Bool)

(assert (=> b!453792 (= e!265555 tp_is_empty!12157)))

(declare-fun b!453793 () Bool)

(assert (=> b!453793 (= e!265554 false)))

(declare-datatypes ((tuple2!8076 0))(
  ( (tuple2!8077 (_1!4049 (_ BitVec 64)) (_2!4049 V!17315)) )
))
(declare-datatypes ((List!8135 0))(
  ( (Nil!8132) (Cons!8131 (h!8987 tuple2!8076) (t!13954 List!8135)) )
))
(declare-datatypes ((ListLongMap!6979 0))(
  ( (ListLongMap!6980 (toList!3505 List!8135)) )
))
(declare-fun lt!205826 () ListLongMap!6979)

(declare-fun minValue!515 () V!17315)

(declare-fun defaultEntry!557 () Int)

(declare-fun zeroValue!515 () V!17315)

(declare-fun v!412 () V!17315)

(declare-fun getCurrentListMapNoExtraKeys!1700 (array!28111 array!28113 (_ BitVec 32) (_ BitVec 32) V!17315 V!17315 (_ BitVec 32) Int) ListLongMap!6979)

(assert (=> b!453793 (= lt!205826 (getCurrentListMapNoExtraKeys!1700 lt!205824 (array!28114 (store (arr!13500 _values!549) i!563 (ValueCellFull!5735 v!412)) (size!13853 _values!549)) mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun lt!205825 () ListLongMap!6979)

(assert (=> b!453793 (= lt!205825 (getCurrentListMapNoExtraKeys!1700 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun mapNonEmpty!19876 () Bool)

(declare-fun tp!38283 () Bool)

(assert (=> mapNonEmpty!19876 (= mapRes!19876 (and tp!38283 e!265555))))

(declare-fun mapValue!19876 () ValueCell!5735)

(declare-fun mapKey!19876 () (_ BitVec 32))

(declare-fun mapRest!19876 () (Array (_ BitVec 32) ValueCell!5735))

(assert (=> mapNonEmpty!19876 (= (arr!13500 _values!549) (store mapRest!19876 mapKey!19876 mapValue!19876))))

(declare-fun b!453794 () Bool)

(declare-fun res!270329 () Bool)

(assert (=> b!453794 (=> (not res!270329) (not e!265552))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!453794 (= res!270329 (validMask!0 mask!1025))))

(declare-fun b!453795 () Bool)

(declare-fun res!270332 () Bool)

(assert (=> b!453795 (=> (not res!270332) (not e!265552))))

(assert (=> b!453795 (= res!270332 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(assert (= (and start!40870 res!270334) b!453794))

(assert (= (and b!453794 res!270329) b!453789))

(assert (= (and b!453789 res!270333) b!453795))

(assert (= (and b!453795 res!270332) b!453786))

(assert (= (and b!453786 res!270337) b!453784))

(assert (= (and b!453784 res!270330) b!453790))

(assert (= (and b!453790 res!270331) b!453788))

(assert (= (and b!453788 res!270327) b!453781))

(assert (= (and b!453781 res!270336) b!453787))

(assert (= (and b!453787 res!270335) b!453783))

(assert (= (and b!453783 res!270328) b!453785))

(assert (= (and b!453785 res!270338) b!453793))

(assert (= (and b!453791 condMapEmpty!19876) mapIsEmpty!19876))

(assert (= (and b!453791 (not condMapEmpty!19876)) mapNonEmpty!19876))

(get-info :version)

(assert (= (and mapNonEmpty!19876 ((_ is ValueCellFull!5735) mapValue!19876)) b!453792))

(assert (= (and b!453791 ((_ is ValueCellFull!5735) mapDefault!19876)) b!453782))

(assert (= start!40870 b!453791))

(declare-fun m!437567 () Bool)

(assert (=> mapNonEmpty!19876 m!437567))

(declare-fun m!437569 () Bool)

(assert (=> b!453790 m!437569))

(declare-fun m!437571 () Bool)

(assert (=> b!453788 m!437571))

(declare-fun m!437573 () Bool)

(assert (=> b!453793 m!437573))

(declare-fun m!437575 () Bool)

(assert (=> b!453793 m!437575))

(declare-fun m!437577 () Bool)

(assert (=> b!453793 m!437577))

(declare-fun m!437579 () Bool)

(assert (=> b!453786 m!437579))

(declare-fun m!437581 () Bool)

(assert (=> b!453787 m!437581))

(declare-fun m!437583 () Bool)

(assert (=> b!453787 m!437583))

(declare-fun m!437585 () Bool)

(assert (=> b!453783 m!437585))

(declare-fun m!437587 () Bool)

(assert (=> b!453795 m!437587))

(declare-fun m!437589 () Bool)

(assert (=> start!40870 m!437589))

(declare-fun m!437591 () Bool)

(assert (=> start!40870 m!437591))

(declare-fun m!437593 () Bool)

(assert (=> b!453794 m!437593))

(declare-fun m!437595 () Bool)

(assert (=> b!453781 m!437595))

(check-sat (not b!453781) (not b!453783) (not b!453786) (not b_next!10819) (not start!40870) (not b!453787) (not b!453794) b_and!18935 (not b!453790) (not mapNonEmpty!19876) (not b!453793) (not b!453795) tp_is_empty!12157)
(check-sat b_and!18935 (not b_next!10819))
