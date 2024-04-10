; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!35798 () Bool)

(assert start!35798)

(declare-fun b!359570 () Bool)

(declare-fun e!220258 () Bool)

(assert (=> b!359570 (= e!220258 false)))

(declare-fun lt!166364 () Bool)

(declare-datatypes ((array!20057 0))(
  ( (array!20058 (arr!9522 (Array (_ BitVec 32) (_ BitVec 64))) (size!9874 (_ BitVec 32))) )
))
(declare-fun _keys!1456 () array!20057)

(declare-datatypes ((List!5472 0))(
  ( (Nil!5469) (Cons!5468 (h!6324 (_ BitVec 64)) (t!10622 List!5472)) )
))
(declare-fun arrayNoDuplicates!0 (array!20057 (_ BitVec 32) List!5472) Bool)

(assert (=> b!359570 (= lt!166364 (arrayNoDuplicates!0 _keys!1456 #b00000000000000000000000000000000 Nil!5469))))

(declare-fun b!359571 () Bool)

(declare-fun res!199846 () Bool)

(assert (=> b!359571 (=> (not res!199846) (not e!220258))))

(declare-fun mask!1842 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!20057 (_ BitVec 32)) Bool)

(assert (=> b!359571 (= res!199846 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1456 mask!1842))))

(declare-fun b!359572 () Bool)

(declare-fun e!220260 () Bool)

(declare-fun e!220261 () Bool)

(declare-fun mapRes!13884 () Bool)

(assert (=> b!359572 (= e!220260 (and e!220261 mapRes!13884))))

(declare-fun condMapEmpty!13884 () Bool)

(declare-datatypes ((V!11979 0))(
  ( (V!11980 (val!4170 Int)) )
))
(declare-datatypes ((ValueCell!3782 0))(
  ( (ValueCellFull!3782 (v!6364 V!11979)) (EmptyCell!3782) )
))
(declare-datatypes ((array!20059 0))(
  ( (array!20060 (arr!9523 (Array (_ BitVec 32) ValueCell!3782)) (size!9875 (_ BitVec 32))) )
))
(declare-fun _values!1208 () array!20059)

(declare-fun mapDefault!13884 () ValueCell!3782)

