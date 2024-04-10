; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!84364 () Bool)

(assert start!84364)

(declare-fun b!986803 () Bool)

(declare-fun e!556465 () Bool)

(assert (=> b!986803 (= e!556465 false)))

(declare-fun lt!437546 () Bool)

(declare-datatypes ((array!62295 0))(
  ( (array!62296 (arr!30005 (Array (_ BitVec 32) (_ BitVec 64))) (size!30484 (_ BitVec 32))) )
))
(declare-fun _keys!1544 () array!62295)

(declare-datatypes ((List!20753 0))(
  ( (Nil!20750) (Cons!20749 (h!21911 (_ BitVec 64)) (t!29652 List!20753)) )
))
(declare-fun arrayNoDuplicates!0 (array!62295 (_ BitVec 32) List!20753) Bool)

(assert (=> b!986803 (= lt!437546 (arrayNoDuplicates!0 _keys!1544 #b00000000000000000000000000000000 Nil!20750))))

(declare-fun b!986804 () Bool)

(declare-fun res!660186 () Bool)

(assert (=> b!986804 (=> (not res!660186) (not e!556465))))

(declare-fun mask!1948 () (_ BitVec 32))

(declare-datatypes ((V!35873 0))(
  ( (V!35874 (val!11634 Int)) )
))
(declare-datatypes ((ValueCell!11102 0))(
  ( (ValueCellFull!11102 (v!14196 V!35873)) (EmptyCell!11102) )
))
(declare-datatypes ((array!62297 0))(
  ( (array!62298 (arr!30006 (Array (_ BitVec 32) ValueCell!11102)) (size!30485 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!62297)

(declare-fun extraKeys!1199 () (_ BitVec 32))

(assert (=> b!986804 (= res!660186 (and (= (size!30485 _values!1278) (bvadd #b00000000000000000000000000000001 mask!1948)) (= (size!30484 _keys!1544) (size!30485 _values!1278)) (bvsge mask!1948 #b00000000000000000000000000000000) (bvsge extraKeys!1199 #b00000000000000000000000000000000) (bvsle extraKeys!1199 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!36779 () Bool)

(declare-fun mapRes!36779 () Bool)

(declare-fun tp!69634 () Bool)

(declare-fun e!556464 () Bool)

(assert (=> mapNonEmpty!36779 (= mapRes!36779 (and tp!69634 e!556464))))

(declare-fun mapKey!36779 () (_ BitVec 32))

(declare-fun mapRest!36779 () (Array (_ BitVec 32) ValueCell!11102))

(declare-fun mapValue!36779 () ValueCell!11102)

(assert (=> mapNonEmpty!36779 (= (arr!30006 _values!1278) (store mapRest!36779 mapKey!36779 mapValue!36779))))

(declare-fun b!986805 () Bool)

(declare-fun e!556466 () Bool)

(declare-fun e!556463 () Bool)

(assert (=> b!986805 (= e!556466 (and e!556463 mapRes!36779))))

(declare-fun condMapEmpty!36779 () Bool)

(declare-fun mapDefault!36779 () ValueCell!11102)

