; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!40646 () Bool)

(assert start!40646)

(declare-fun b_free!10657 () Bool)

(declare-fun b_next!10657 () Bool)

(assert (=> start!40646 (= b_free!10657 (not b_next!10657))))

(declare-fun tp!37791 () Bool)

(declare-fun b_and!18665 () Bool)

(assert (=> start!40646 (= tp!37791 b_and!18665)))

(declare-fun b!448952 () Bool)

(declare-fun res!266954 () Bool)

(declare-fun e!263335 () Bool)

(assert (=> b!448952 (=> (not res!266954) (not e!263335))))

(declare-fun k!794 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!448952 (= res!266954 (validKeyInArray!0 k!794))))

(declare-fun b!448954 () Bool)

(declare-fun e!263332 () Bool)

(assert (=> b!448954 (= e!263332 false)))

(declare-fun from!863 () (_ BitVec 32))

(declare-datatypes ((V!17099 0))(
  ( (V!17100 (val!6042 Int)) )
))
(declare-fun minValue!515 () V!17099)

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((array!27797 0))(
  ( (array!27798 (arr!13344 (Array (_ BitVec 32) (_ BitVec 64))) (size!13696 (_ BitVec 32))) )
))
(declare-fun lt!204269 () array!27797)

(declare-datatypes ((tuple2!7928 0))(
  ( (tuple2!7929 (_1!3975 (_ BitVec 64)) (_2!3975 V!17099)) )
))
(declare-datatypes ((List!7994 0))(
  ( (Nil!7991) (Cons!7990 (h!8846 tuple2!7928) (t!13756 List!7994)) )
))
(declare-datatypes ((ListLongMap!6841 0))(
  ( (ListLongMap!6842 (toList!3436 List!7994)) )
))
(declare-fun lt!204268 () ListLongMap!6841)

(declare-datatypes ((ValueCell!5654 0))(
  ( (ValueCellFull!5654 (v!8297 V!17099)) (EmptyCell!5654) )
))
(declare-datatypes ((array!27799 0))(
  ( (array!27800 (arr!13345 (Array (_ BitVec 32) ValueCell!5654)) (size!13697 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!27799)

(declare-fun i!563 () (_ BitVec 32))

(declare-fun v!412 () V!17099)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun zeroValue!515 () V!17099)

(declare-fun getCurrentListMapNoExtraKeys!1622 (array!27797 array!27799 (_ BitVec 32) (_ BitVec 32) V!17099 V!17099 (_ BitVec 32) Int) ListLongMap!6841)

(assert (=> b!448954 (= lt!204268 (getCurrentListMapNoExtraKeys!1622 lt!204269 (array!27800 (store (arr!13345 _values!549) i!563 (ValueCellFull!5654 v!412)) (size!13697 _values!549)) mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun lt!204270 () ListLongMap!6841)

(declare-fun _keys!709 () array!27797)

(assert (=> b!448954 (= lt!204270 (getCurrentListMapNoExtraKeys!1622 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!448955 () Bool)

(assert (=> b!448955 (= e!263335 e!263332)))

(declare-fun res!266948 () Bool)

(assert (=> b!448955 (=> (not res!266948) (not e!263332))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!27797 (_ BitVec 32)) Bool)

(assert (=> b!448955 (= res!266948 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!204269 mask!1025))))

(assert (=> b!448955 (= lt!204269 (array!27798 (store (arr!13344 _keys!709) i!563 k!794) (size!13696 _keys!709)))))

(declare-fun mapNonEmpty!19626 () Bool)

(declare-fun mapRes!19626 () Bool)

(declare-fun tp!37790 () Bool)

(declare-fun e!263331 () Bool)

(assert (=> mapNonEmpty!19626 (= mapRes!19626 (and tp!37790 e!263331))))

(declare-fun mapKey!19626 () (_ BitVec 32))

(declare-fun mapRest!19626 () (Array (_ BitVec 32) ValueCell!5654))

(declare-fun mapValue!19626 () ValueCell!5654)

(assert (=> mapNonEmpty!19626 (= (arr!13345 _values!549) (store mapRest!19626 mapKey!19626 mapValue!19626))))

(declare-fun b!448956 () Bool)

(declare-fun res!266952 () Bool)

(assert (=> b!448956 (=> (not res!266952) (not e!263335))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!448956 (= res!266952 (validMask!0 mask!1025))))

(declare-fun b!448957 () Bool)

(declare-fun res!266947 () Bool)

(assert (=> b!448957 (=> (not res!266947) (not e!263335))))

(assert (=> b!448957 (= res!266947 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13696 _keys!709))))))

(declare-fun b!448958 () Bool)

(declare-fun res!266944 () Bool)

(assert (=> b!448958 (=> (not res!266944) (not e!263335))))

(assert (=> b!448958 (= res!266944 (or (= (select (arr!13344 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!13344 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!448959 () Bool)

(declare-fun e!263336 () Bool)

(declare-fun tp_is_empty!11995 () Bool)

(assert (=> b!448959 (= e!263336 tp_is_empty!11995)))

(declare-fun b!448960 () Bool)

(declare-fun res!266949 () Bool)

(assert (=> b!448960 (=> (not res!266949) (not e!263335))))

(assert (=> b!448960 (= res!266949 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!448961 () Bool)

(declare-fun res!266946 () Bool)

(assert (=> b!448961 (=> (not res!266946) (not e!263335))))

(assert (=> b!448961 (= res!266946 (and (= (size!13697 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13696 _keys!709) (size!13697 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!448953 () Bool)

(declare-fun e!263334 () Bool)

(assert (=> b!448953 (= e!263334 (and e!263336 mapRes!19626))))

(declare-fun condMapEmpty!19626 () Bool)

(declare-fun mapDefault!19626 () ValueCell!5654)

