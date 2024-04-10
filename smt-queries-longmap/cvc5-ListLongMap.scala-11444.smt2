; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!133462 () Bool)

(assert start!133462)

(declare-fun mapNonEmpty!59193 () Bool)

(declare-fun mapRes!59193 () Bool)

(declare-fun tp!112848 () Bool)

(declare-fun e!869415 () Bool)

(assert (=> mapNonEmpty!59193 (= mapRes!59193 (and tp!112848 e!869415))))

(declare-fun mapKey!59193 () (_ BitVec 32))

(declare-datatypes ((V!59601 0))(
  ( (V!59602 (val!19356 Int)) )
))
(declare-datatypes ((ValueCell!18242 0))(
  ( (ValueCellFull!18242 (v!22108 V!59601)) (EmptyCell!18242) )
))
(declare-fun mapRest!59193 () (Array (_ BitVec 32) ValueCell!18242))

(declare-fun mapValue!59193 () ValueCell!18242)

(declare-datatypes ((array!103814 0))(
  ( (array!103815 (arr!50099 (Array (_ BitVec 32) ValueCell!18242)) (size!50649 (_ BitVec 32))) )
))
(declare-fun _values!487 () array!103814)

(assert (=> mapNonEmpty!59193 (= (arr!50099 _values!487) (store mapRest!59193 mapKey!59193 mapValue!59193))))

(declare-fun b!1560303 () Bool)

(declare-fun res!1066964 () Bool)

(declare-fun e!869417 () Bool)

(assert (=> b!1560303 (=> (not res!1066964) (not e!869417))))

(declare-datatypes ((array!103816 0))(
  ( (array!103817 (arr!50100 (Array (_ BitVec 32) (_ BitVec 64))) (size!50650 (_ BitVec 32))) )
))
(declare-fun _keys!637 () array!103816)

(declare-fun mask!947 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!103816 (_ BitVec 32)) Bool)

(assert (=> b!1560303 (= res!1066964 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!637 mask!947))))

(declare-fun res!1066961 () Bool)

(assert (=> start!133462 (=> (not res!1066961) (not e!869417))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!133462 (= res!1066961 (validMask!0 mask!947))))

(assert (=> start!133462 e!869417))

(assert (=> start!133462 true))

(declare-fun array_inv!38943 (array!103816) Bool)

(assert (=> start!133462 (array_inv!38943 _keys!637)))

(declare-fun e!869419 () Bool)

(declare-fun array_inv!38944 (array!103814) Bool)

(assert (=> start!133462 (and (array_inv!38944 _values!487) e!869419)))

(declare-fun b!1560304 () Bool)

(declare-fun tp_is_empty!38545 () Bool)

(assert (=> b!1560304 (= e!869415 tp_is_empty!38545)))

(declare-fun b!1560305 () Bool)

(declare-fun res!1066963 () Bool)

(assert (=> b!1560305 (=> (not res!1066963) (not e!869417))))

(declare-fun extraKeys!434 () (_ BitVec 32))

(assert (=> b!1560305 (= res!1066963 (and (= (size!50649 _values!487) (bvadd #b00000000000000000000000000000001 mask!947)) (= (size!50650 _keys!637) (size!50649 _values!487)) (bvsge mask!947 #b00000000000000000000000000000000) (bvsge extraKeys!434 #b00000000000000000000000000000000) (bvsle extraKeys!434 #b00000000000000000000000000000011)))))

(declare-fun b!1560306 () Bool)

(declare-fun e!869416 () Bool)

(assert (=> b!1560306 (= e!869416 tp_is_empty!38545)))

(declare-fun b!1560307 () Bool)

(assert (=> b!1560307 (= e!869419 (and e!869416 mapRes!59193))))

(declare-fun condMapEmpty!59193 () Bool)

(declare-fun mapDefault!59193 () ValueCell!18242)

