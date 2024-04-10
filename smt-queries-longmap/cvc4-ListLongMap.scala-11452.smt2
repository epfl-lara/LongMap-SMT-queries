; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!133514 () Bool)

(assert start!133514)

(declare-fun mapIsEmpty!59271 () Bool)

(declare-fun mapRes!59271 () Bool)

(assert (=> mapIsEmpty!59271 mapRes!59271))

(declare-fun res!1067217 () Bool)

(declare-fun e!869809 () Bool)

(assert (=> start!133514 (=> (not res!1067217) (not e!869809))))

(declare-fun mask!947 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!133514 (= res!1067217 (validMask!0 mask!947))))

(assert (=> start!133514 e!869809))

(assert (=> start!133514 true))

(declare-datatypes ((V!59669 0))(
  ( (V!59670 (val!19382 Int)) )
))
(declare-datatypes ((ValueCell!18268 0))(
  ( (ValueCellFull!18268 (v!22134 V!59669)) (EmptyCell!18268) )
))
(declare-datatypes ((array!103912 0))(
  ( (array!103913 (arr!50148 (Array (_ BitVec 32) ValueCell!18268)) (size!50698 (_ BitVec 32))) )
))
(declare-fun _values!487 () array!103912)

(declare-fun e!869808 () Bool)

(declare-fun array_inv!38983 (array!103912) Bool)

(assert (=> start!133514 (and (array_inv!38983 _values!487) e!869808)))

(declare-datatypes ((array!103914 0))(
  ( (array!103915 (arr!50149 (Array (_ BitVec 32) (_ BitVec 64))) (size!50699 (_ BitVec 32))) )
))
(declare-fun _keys!637 () array!103914)

(declare-fun array_inv!38984 (array!103914) Bool)

(assert (=> start!133514 (array_inv!38984 _keys!637)))

(declare-fun b!1560792 () Bool)

(assert (=> b!1560792 (= e!869809 false)))

(declare-fun lt!671052 () Bool)

(declare-datatypes ((List!36409 0))(
  ( (Nil!36406) (Cons!36405 (h!37851 (_ BitVec 64)) (t!51142 List!36409)) )
))
(declare-fun arrayNoDuplicates!0 (array!103914 (_ BitVec 32) List!36409) Bool)

(assert (=> b!1560792 (= lt!671052 (arrayNoDuplicates!0 _keys!637 #b00000000000000000000000000000000 Nil!36406))))

(declare-fun b!1560793 () Bool)

(declare-fun res!1067215 () Bool)

(assert (=> b!1560793 (=> (not res!1067215) (not e!869809))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!103914 (_ BitVec 32)) Bool)

(assert (=> b!1560793 (= res!1067215 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!637 mask!947))))

(declare-fun b!1560794 () Bool)

(declare-fun e!869805 () Bool)

(declare-fun tp_is_empty!38597 () Bool)

(assert (=> b!1560794 (= e!869805 tp_is_empty!38597)))

(declare-fun b!1560795 () Bool)

(declare-fun e!869807 () Bool)

(assert (=> b!1560795 (= e!869808 (and e!869807 mapRes!59271))))

(declare-fun condMapEmpty!59271 () Bool)

(declare-fun mapDefault!59271 () ValueCell!18268)

