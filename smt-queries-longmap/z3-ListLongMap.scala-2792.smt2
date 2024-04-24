; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!40626 () Bool)

(assert start!40626)

(declare-fun b_free!10651 () Bool)

(declare-fun b_next!10651 () Bool)

(assert (=> start!40626 (= b_free!10651 (not b_next!10651))))

(declare-fun tp!37773 () Bool)

(declare-fun b_and!18673 () Bool)

(assert (=> start!40626 (= tp!37773 b_and!18673)))

(declare-fun mapNonEmpty!19617 () Bool)

(declare-fun mapRes!19617 () Bool)

(declare-fun tp!37772 () Bool)

(declare-fun e!263249 () Bool)

(assert (=> mapNonEmpty!19617 (= mapRes!19617 (and tp!37772 e!263249))))

(declare-datatypes ((V!17091 0))(
  ( (V!17092 (val!6039 Int)) )
))
(declare-datatypes ((ValueCell!5651 0))(
  ( (ValueCellFull!5651 (v!8295 V!17091)) (EmptyCell!5651) )
))
(declare-fun mapRest!19617 () (Array (_ BitVec 32) ValueCell!5651))

(declare-fun mapKey!19617 () (_ BitVec 32))

(declare-datatypes ((array!27780 0))(
  ( (array!27781 (arr!13335 (Array (_ BitVec 32) ValueCell!5651)) (size!13687 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!27780)

(declare-fun mapValue!19617 () ValueCell!5651)

(assert (=> mapNonEmpty!19617 (= (arr!13335 _values!549) (store mapRest!19617 mapKey!19617 mapValue!19617))))

(declare-fun b!448768 () Bool)

(declare-fun res!266843 () Bool)

(declare-fun e!263245 () Bool)

(assert (=> b!448768 (=> (not res!266843) (not e!263245))))

(declare-datatypes ((array!27782 0))(
  ( (array!27783 (arr!13336 (Array (_ BitVec 32) (_ BitVec 64))) (size!13688 (_ BitVec 32))) )
))
(declare-fun lt!204260 () array!27782)

(declare-datatypes ((List!7903 0))(
  ( (Nil!7900) (Cons!7899 (h!8755 (_ BitVec 64)) (t!13657 List!7903)) )
))
(declare-fun arrayNoDuplicates!0 (array!27782 (_ BitVec 32) List!7903) Bool)

(assert (=> b!448768 (= res!266843 (arrayNoDuplicates!0 lt!204260 #b00000000000000000000000000000000 Nil!7900))))

(declare-fun b!448769 () Bool)

(declare-fun res!266837 () Bool)

(assert (=> b!448769 (=> (not res!266837) (not e!263245))))

(declare-fun from!863 () (_ BitVec 32))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!448769 (= res!266837 (bvsle from!863 i!563))))

(declare-fun b!448770 () Bool)

(declare-fun tp_is_empty!11989 () Bool)

(assert (=> b!448770 (= e!263249 tp_is_empty!11989)))

(declare-fun b!448771 () Bool)

(declare-fun res!266842 () Bool)

(declare-fun e!263250 () Bool)

(assert (=> b!448771 (=> (not res!266842) (not e!263250))))

(declare-fun _keys!709 () array!27782)

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!27782 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!448771 (= res!266842 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!448772 () Bool)

(declare-fun e!263248 () Bool)

(declare-fun e!263246 () Bool)

(assert (=> b!448772 (= e!263248 (and e!263246 mapRes!19617))))

(declare-fun condMapEmpty!19617 () Bool)

(declare-fun mapDefault!19617 () ValueCell!5651)

(assert (=> b!448772 (= condMapEmpty!19617 (= (arr!13335 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5651)) mapDefault!19617)))))

(declare-fun b!448773 () Bool)

(declare-fun res!266833 () Bool)

(assert (=> b!448773 (=> (not res!266833) (not e!263250))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun mask!1025 () (_ BitVec 32))

(assert (=> b!448773 (= res!266833 (and (= (size!13687 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13688 _keys!709) (size!13687 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!448774 () Bool)

(assert (=> b!448774 (= e!263245 false)))

(declare-fun defaultEntry!557 () Int)

(declare-fun zeroValue!515 () V!17091)

(declare-fun v!412 () V!17091)

(declare-datatypes ((tuple2!7830 0))(
  ( (tuple2!7831 (_1!3926 (_ BitVec 64)) (_2!3926 V!17091)) )
))
(declare-datatypes ((List!7904 0))(
  ( (Nil!7901) (Cons!7900 (h!8756 tuple2!7830) (t!13658 List!7904)) )
))
(declare-datatypes ((ListLongMap!6745 0))(
  ( (ListLongMap!6746 (toList!3388 List!7904)) )
))
(declare-fun lt!204261 () ListLongMap!6745)

(declare-fun minValue!515 () V!17091)

(declare-fun getCurrentListMapNoExtraKeys!1618 (array!27782 array!27780 (_ BitVec 32) (_ BitVec 32) V!17091 V!17091 (_ BitVec 32) Int) ListLongMap!6745)

(assert (=> b!448774 (= lt!204261 (getCurrentListMapNoExtraKeys!1618 lt!204260 (array!27781 (store (arr!13335 _values!549) i!563 (ValueCellFull!5651 v!412)) (size!13687 _values!549)) mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun lt!204262 () ListLongMap!6745)

(assert (=> b!448774 (= lt!204262 (getCurrentListMapNoExtraKeys!1618 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!448775 () Bool)

(assert (=> b!448775 (= e!263250 e!263245)))

(declare-fun res!266838 () Bool)

(assert (=> b!448775 (=> (not res!266838) (not e!263245))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!27782 (_ BitVec 32)) Bool)

(assert (=> b!448775 (= res!266838 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!204260 mask!1025))))

(assert (=> b!448775 (= lt!204260 (array!27783 (store (arr!13336 _keys!709) i!563 k0!794) (size!13688 _keys!709)))))

(declare-fun b!448776 () Bool)

(declare-fun res!266840 () Bool)

(assert (=> b!448776 (=> (not res!266840) (not e!263250))))

(assert (=> b!448776 (= res!266840 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13688 _keys!709))))))

(declare-fun res!266839 () Bool)

(assert (=> start!40626 (=> (not res!266839) (not e!263250))))

(assert (=> start!40626 (= res!266839 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13688 _keys!709))))))

(assert (=> start!40626 e!263250))

(assert (=> start!40626 tp_is_empty!11989))

(assert (=> start!40626 tp!37773))

(assert (=> start!40626 true))

(declare-fun array_inv!9744 (array!27780) Bool)

(assert (=> start!40626 (and (array_inv!9744 _values!549) e!263248)))

(declare-fun array_inv!9745 (array!27782) Bool)

(assert (=> start!40626 (array_inv!9745 _keys!709)))

(declare-fun b!448777 () Bool)

(declare-fun res!266836 () Bool)

(assert (=> b!448777 (=> (not res!266836) (not e!263250))))

(assert (=> b!448777 (= res!266836 (or (= (select (arr!13336 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!13336 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun mapIsEmpty!19617 () Bool)

(assert (=> mapIsEmpty!19617 mapRes!19617))

(declare-fun b!448778 () Bool)

(declare-fun res!266834 () Bool)

(assert (=> b!448778 (=> (not res!266834) (not e!263250))))

(assert (=> b!448778 (= res!266834 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!448779 () Bool)

(assert (=> b!448779 (= e!263246 tp_is_empty!11989)))

(declare-fun b!448780 () Bool)

(declare-fun res!266835 () Bool)

(assert (=> b!448780 (=> (not res!266835) (not e!263250))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!448780 (= res!266835 (validMask!0 mask!1025))))

(declare-fun b!448781 () Bool)

(declare-fun res!266844 () Bool)

(assert (=> b!448781 (=> (not res!266844) (not e!263250))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!448781 (= res!266844 (validKeyInArray!0 k0!794))))

(declare-fun b!448782 () Bool)

(declare-fun res!266841 () Bool)

(assert (=> b!448782 (=> (not res!266841) (not e!263250))))

(assert (=> b!448782 (= res!266841 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7900))))

(assert (= (and start!40626 res!266839) b!448780))

(assert (= (and b!448780 res!266835) b!448773))

(assert (= (and b!448773 res!266833) b!448778))

(assert (= (and b!448778 res!266834) b!448782))

(assert (= (and b!448782 res!266841) b!448776))

(assert (= (and b!448776 res!266840) b!448781))

(assert (= (and b!448781 res!266844) b!448777))

(assert (= (and b!448777 res!266836) b!448771))

(assert (= (and b!448771 res!266842) b!448775))

(assert (= (and b!448775 res!266838) b!448768))

(assert (= (and b!448768 res!266843) b!448769))

(assert (= (and b!448769 res!266837) b!448774))

(assert (= (and b!448772 condMapEmpty!19617) mapIsEmpty!19617))

(assert (= (and b!448772 (not condMapEmpty!19617)) mapNonEmpty!19617))

(get-info :version)

(assert (= (and mapNonEmpty!19617 ((_ is ValueCellFull!5651) mapValue!19617)) b!448770))

(assert (= (and b!448772 ((_ is ValueCellFull!5651) mapDefault!19617)) b!448779))

(assert (= start!40626 b!448772))

(declare-fun m!433461 () Bool)

(assert (=> b!448781 m!433461))

(declare-fun m!433463 () Bool)

(assert (=> b!448780 m!433463))

(declare-fun m!433465 () Bool)

(assert (=> b!448782 m!433465))

(declare-fun m!433467 () Bool)

(assert (=> b!448771 m!433467))

(declare-fun m!433469 () Bool)

(assert (=> b!448775 m!433469))

(declare-fun m!433471 () Bool)

(assert (=> b!448775 m!433471))

(declare-fun m!433473 () Bool)

(assert (=> mapNonEmpty!19617 m!433473))

(declare-fun m!433475 () Bool)

(assert (=> b!448768 m!433475))

(declare-fun m!433477 () Bool)

(assert (=> b!448778 m!433477))

(declare-fun m!433479 () Bool)

(assert (=> b!448774 m!433479))

(declare-fun m!433481 () Bool)

(assert (=> b!448774 m!433481))

(declare-fun m!433483 () Bool)

(assert (=> b!448774 m!433483))

(declare-fun m!433485 () Bool)

(assert (=> b!448777 m!433485))

(declare-fun m!433487 () Bool)

(assert (=> start!40626 m!433487))

(declare-fun m!433489 () Bool)

(assert (=> start!40626 m!433489))

(check-sat (not start!40626) (not mapNonEmpty!19617) (not b!448768) (not b!448781) (not b!448774) (not b!448782) (not b!448780) (not b!448775) (not b!448771) tp_is_empty!11989 b_and!18673 (not b_next!10651) (not b!448778))
(check-sat b_and!18673 (not b_next!10651))
