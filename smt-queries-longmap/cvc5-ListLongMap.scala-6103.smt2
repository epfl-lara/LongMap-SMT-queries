; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!78726 () Bool)

(assert start!78726)

(declare-fun b_free!16939 () Bool)

(declare-fun b_next!16939 () Bool)

(assert (=> start!78726 (= b_free!16939 (not b_next!16939))))

(declare-fun tp!59257 () Bool)

(declare-fun b_and!27615 () Bool)

(assert (=> start!78726 (= tp!59257 b_and!27615)))

(declare-fun b!918329 () Bool)

(declare-fun res!619152 () Bool)

(declare-fun e!515518 () Bool)

(assert (=> b!918329 (=> (not res!619152) (not e!515518))))

(declare-fun from!1844 () (_ BitVec 32))

(assert (=> b!918329 (= res!619152 (bvsgt from!1844 #b00000000000000000000000000000000))))

(declare-fun b!918330 () Bool)

(declare-fun res!619154 () Bool)

(declare-fun e!515524 () Bool)

(assert (=> b!918330 (=> (not res!619154) (not e!515524))))

(declare-datatypes ((array!54878 0))(
  ( (array!54879 (arr!26384 (Array (_ BitVec 32) (_ BitVec 64))) (size!26843 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!54878)

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(declare-datatypes ((V!30895 0))(
  ( (V!30896 (val!9774 Int)) )
))
(declare-datatypes ((ValueCell!9242 0))(
  ( (ValueCellFull!9242 (v!12292 V!30895)) (EmptyCell!9242) )
))
(declare-datatypes ((array!54880 0))(
  ( (array!54881 (arr!26385 (Array (_ BitVec 32) ValueCell!9242)) (size!26844 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!54880)

(assert (=> b!918330 (= res!619154 (and (= (size!26844 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!26843 _keys!1487) (size!26844 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun b!918331 () Bool)

(declare-fun res!619159 () Bool)

(assert (=> b!918331 (=> (not res!619159) (not e!515524))))

(declare-datatypes ((List!18506 0))(
  ( (Nil!18503) (Cons!18502 (h!19648 (_ BitVec 64)) (t!26175 List!18506)) )
))
(declare-fun arrayNoDuplicates!0 (array!54878 (_ BitVec 32) List!18506) Bool)

(assert (=> b!918331 (= res!619159 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!18503))))

(declare-fun b!918332 () Bool)

(declare-fun res!619157 () Bool)

(assert (=> b!918332 (=> (not res!619157) (not e!515524))))

(assert (=> b!918332 (= res!619157 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!26843 _keys!1487))))))

(declare-fun b!918333 () Bool)

(declare-fun res!619155 () Bool)

(assert (=> b!918333 (=> (not res!619155) (not e!515524))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!54878 (_ BitVec 32)) Bool)

(assert (=> b!918333 (= res!619155 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun b!918334 () Bool)

(declare-fun res!619151 () Bool)

(assert (=> b!918334 (=> (not res!619151) (not e!515518))))

(declare-fun k!1099 () (_ BitVec 64))

(declare-fun v!791 () V!30895)

(declare-datatypes ((tuple2!12700 0))(
  ( (tuple2!12701 (_1!6361 (_ BitVec 64)) (_2!6361 V!30895)) )
))
(declare-datatypes ((List!18507 0))(
  ( (Nil!18504) (Cons!18503 (h!19649 tuple2!12700) (t!26176 List!18507)) )
))
(declare-datatypes ((ListLongMap!11397 0))(
  ( (ListLongMap!11398 (toList!5714 List!18507)) )
))
(declare-fun lt!412208 () ListLongMap!11397)

(declare-fun apply!562 (ListLongMap!11397 (_ BitVec 64)) V!30895)

(assert (=> b!918334 (= res!619151 (= (apply!562 lt!412208 k!1099) v!791))))

(declare-fun b!918335 () Bool)

(declare-fun e!515520 () Bool)

(declare-fun tp_is_empty!19447 () Bool)

(assert (=> b!918335 (= e!515520 tp_is_empty!19447)))

(declare-fun b!918336 () Bool)

(declare-fun e!515521 () Bool)

(declare-fun mapRes!30927 () Bool)

(assert (=> b!918336 (= e!515521 (and e!515520 mapRes!30927))))

(declare-fun condMapEmpty!30927 () Bool)

(declare-fun mapDefault!30927 () ValueCell!9242)

