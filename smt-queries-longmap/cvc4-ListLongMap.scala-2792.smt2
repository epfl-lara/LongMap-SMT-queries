; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!40644 () Bool)

(assert start!40644)

(declare-fun b_free!10655 () Bool)

(declare-fun b_next!10655 () Bool)

(assert (=> start!40644 (= b_free!10655 (not b_next!10655))))

(declare-fun tp!37785 () Bool)

(declare-fun b_and!18663 () Bool)

(assert (=> start!40644 (= tp!37785 b_and!18663)))

(declare-fun b!448907 () Bool)

(declare-fun res!266916 () Bool)

(declare-fun e!263313 () Bool)

(assert (=> b!448907 (=> (not res!266916) (not e!263313))))

(declare-fun from!863 () (_ BitVec 32))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!448907 (= res!266916 (bvsle from!863 i!563))))

(declare-fun b!448909 () Bool)

(declare-fun res!266915 () Bool)

(declare-fun e!263317 () Bool)

(assert (=> b!448909 (=> (not res!266915) (not e!263317))))

(declare-datatypes ((array!27793 0))(
  ( (array!27794 (arr!13342 (Array (_ BitVec 32) (_ BitVec 64))) (size!13694 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!27793)

(assert (=> b!448909 (= res!266915 (or (= (select (arr!13342 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!13342 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!448910 () Bool)

(declare-fun res!266917 () Bool)

(assert (=> b!448910 (=> (not res!266917) (not e!263313))))

(declare-fun lt!204260 () array!27793)

(declare-datatypes ((List!7993 0))(
  ( (Nil!7990) (Cons!7989 (h!8845 (_ BitVec 64)) (t!13755 List!7993)) )
))
(declare-fun arrayNoDuplicates!0 (array!27793 (_ BitVec 32) List!7993) Bool)

(assert (=> b!448910 (= res!266917 (arrayNoDuplicates!0 lt!204260 #b00000000000000000000000000000000 Nil!7990))))

(declare-fun b!448911 () Bool)

(declare-fun res!266918 () Bool)

(assert (=> b!448911 (=> (not res!266918) (not e!263317))))

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!27793 (_ BitVec 32)) Bool)

(assert (=> b!448911 (= res!266918 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!448912 () Bool)

(declare-fun res!266919 () Bool)

(assert (=> b!448912 (=> (not res!266919) (not e!263317))))

(assert (=> b!448912 (= res!266919 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7990))))

(declare-fun mapNonEmpty!19623 () Bool)

(declare-fun mapRes!19623 () Bool)

(declare-fun tp!37784 () Bool)

(declare-fun e!263316 () Bool)

(assert (=> mapNonEmpty!19623 (= mapRes!19623 (and tp!37784 e!263316))))

(declare-datatypes ((V!17095 0))(
  ( (V!17096 (val!6041 Int)) )
))
(declare-datatypes ((ValueCell!5653 0))(
  ( (ValueCellFull!5653 (v!8296 V!17095)) (EmptyCell!5653) )
))
(declare-fun mapRest!19623 () (Array (_ BitVec 32) ValueCell!5653))

(declare-datatypes ((array!27795 0))(
  ( (array!27796 (arr!13343 (Array (_ BitVec 32) ValueCell!5653)) (size!13695 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!27795)

(declare-fun mapValue!19623 () ValueCell!5653)

(declare-fun mapKey!19623 () (_ BitVec 32))

(assert (=> mapNonEmpty!19623 (= (arr!13343 _values!549) (store mapRest!19623 mapKey!19623 mapValue!19623))))

(declare-fun b!448913 () Bool)

(declare-fun e!263315 () Bool)

(declare-fun e!263314 () Bool)

(assert (=> b!448913 (= e!263315 (and e!263314 mapRes!19623))))

(declare-fun condMapEmpty!19623 () Bool)

(declare-fun mapDefault!19623 () ValueCell!5653)

