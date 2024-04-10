; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!40434 () Bool)

(assert start!40434)

(declare-fun res!263825 () Bool)

(declare-fun e!261547 () Bool)

(assert (=> start!40434 (=> (not res!263825) (not e!261547))))

(declare-fun from!863 () (_ BitVec 32))

(declare-datatypes ((array!27445 0))(
  ( (array!27446 (arr!13170 (Array (_ BitVec 32) (_ BitVec 64))) (size!13522 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!27445)

(assert (=> start!40434 (= res!263825 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13522 _keys!709))))))

(assert (=> start!40434 e!261547))

(assert (=> start!40434 true))

(declare-datatypes ((V!16863 0))(
  ( (V!16864 (val!5954 Int)) )
))
(declare-datatypes ((ValueCell!5566 0))(
  ( (ValueCellFull!5566 (v!8205 V!16863)) (EmptyCell!5566) )
))
(declare-datatypes ((array!27447 0))(
  ( (array!27448 (arr!13171 (Array (_ BitVec 32) ValueCell!5566)) (size!13523 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!27447)

(declare-fun e!261544 () Bool)

(declare-fun array_inv!9550 (array!27447) Bool)

(assert (=> start!40434 (and (array_inv!9550 _values!549) e!261544)))

(declare-fun array_inv!9551 (array!27445) Bool)

(assert (=> start!40434 (array_inv!9551 _keys!709)))

(declare-fun b!444809 () Bool)

(declare-fun res!263824 () Bool)

(assert (=> b!444809 (=> (not res!263824) (not e!261547))))

(declare-fun k!794 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!27445 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!444809 (= res!263824 (not (arrayContainsKey!0 _keys!709 k!794 #b00000000000000000000000000000000)))))

(declare-fun b!444810 () Bool)

(declare-fun e!261548 () Bool)

(assert (=> b!444810 (= e!261547 e!261548)))

(declare-fun res!263822 () Bool)

(assert (=> b!444810 (=> (not res!263822) (not e!261548))))

(declare-fun lt!203548 () array!27445)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!27445 (_ BitVec 32)) Bool)

(assert (=> b!444810 (= res!263822 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!203548 mask!1025))))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!444810 (= lt!203548 (array!27446 (store (arr!13170 _keys!709) i!563 k!794) (size!13522 _keys!709)))))

(declare-fun b!444811 () Bool)

(declare-fun res!263828 () Bool)

(assert (=> b!444811 (=> (not res!263828) (not e!261547))))

(assert (=> b!444811 (= res!263828 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13522 _keys!709))))))

(declare-fun b!444812 () Bool)

(declare-fun res!263821 () Bool)

(assert (=> b!444812 (=> (not res!263821) (not e!261547))))

(assert (=> b!444812 (= res!263821 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!444813 () Bool)

(declare-fun e!261543 () Bool)

(declare-fun tp_is_empty!11819 () Bool)

(assert (=> b!444813 (= e!261543 tp_is_empty!11819)))

(declare-fun b!444814 () Bool)

(declare-fun mapRes!19356 () Bool)

(assert (=> b!444814 (= e!261544 (and e!261543 mapRes!19356))))

(declare-fun condMapEmpty!19356 () Bool)

(declare-fun mapDefault!19356 () ValueCell!5566)

