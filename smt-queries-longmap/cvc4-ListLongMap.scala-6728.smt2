; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!84344 () Bool)

(assert start!84344)

(declare-fun b!986596 () Bool)

(declare-fun e!556316 () Bool)

(assert (=> b!986596 (= e!556316 false)))

(declare-fun lt!437516 () Bool)

(declare-datatypes ((array!62255 0))(
  ( (array!62256 (arr!29985 (Array (_ BitVec 32) (_ BitVec 64))) (size!30464 (_ BitVec 32))) )
))
(declare-fun _keys!1544 () array!62255)

(declare-datatypes ((List!20746 0))(
  ( (Nil!20743) (Cons!20742 (h!21904 (_ BitVec 64)) (t!29645 List!20746)) )
))
(declare-fun arrayNoDuplicates!0 (array!62255 (_ BitVec 32) List!20746) Bool)

(assert (=> b!986596 (= lt!437516 (arrayNoDuplicates!0 _keys!1544 #b00000000000000000000000000000000 Nil!20743))))

(declare-fun b!986597 () Bool)

(declare-fun e!556315 () Bool)

(declare-fun tp_is_empty!23147 () Bool)

(assert (=> b!986597 (= e!556315 tp_is_empty!23147)))

(declare-fun res!660070 () Bool)

(assert (=> start!84344 (=> (not res!660070) (not e!556316))))

(declare-fun mask!1948 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!84344 (= res!660070 (validMask!0 mask!1948))))

(assert (=> start!84344 e!556316))

(assert (=> start!84344 true))

(declare-datatypes ((V!35845 0))(
  ( (V!35846 (val!11624 Int)) )
))
(declare-datatypes ((ValueCell!11092 0))(
  ( (ValueCellFull!11092 (v!14186 V!35845)) (EmptyCell!11092) )
))
(declare-datatypes ((array!62257 0))(
  ( (array!62258 (arr!29986 (Array (_ BitVec 32) ValueCell!11092)) (size!30465 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!62257)

(declare-fun e!556314 () Bool)

(declare-fun array_inv!23175 (array!62257) Bool)

(assert (=> start!84344 (and (array_inv!23175 _values!1278) e!556314)))

(declare-fun array_inv!23176 (array!62255) Bool)

(assert (=> start!84344 (array_inv!23176 _keys!1544)))

(declare-fun b!986598 () Bool)

(declare-fun res!660071 () Bool)

(assert (=> b!986598 (=> (not res!660071) (not e!556316))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!62255 (_ BitVec 32)) Bool)

(assert (=> b!986598 (= res!660071 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1544 mask!1948))))

(declare-fun b!986599 () Bool)

(declare-fun res!660069 () Bool)

(assert (=> b!986599 (=> (not res!660069) (not e!556316))))

(declare-fun extraKeys!1199 () (_ BitVec 32))

(assert (=> b!986599 (= res!660069 (and (= (size!30465 _values!1278) (bvadd #b00000000000000000000000000000001 mask!1948)) (= (size!30464 _keys!1544) (size!30465 _values!1278)) (bvsge mask!1948 #b00000000000000000000000000000000) (bvsge extraKeys!1199 #b00000000000000000000000000000000) (bvsle extraKeys!1199 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!36749 () Bool)

(declare-fun mapRes!36749 () Bool)

(declare-fun tp!69604 () Bool)

(assert (=> mapNonEmpty!36749 (= mapRes!36749 (and tp!69604 e!556315))))

(declare-fun mapRest!36749 () (Array (_ BitVec 32) ValueCell!11092))

(declare-fun mapValue!36749 () ValueCell!11092)

(declare-fun mapKey!36749 () (_ BitVec 32))

(assert (=> mapNonEmpty!36749 (= (arr!29986 _values!1278) (store mapRest!36749 mapKey!36749 mapValue!36749))))

(declare-fun b!986600 () Bool)

(declare-fun e!556317 () Bool)

(assert (=> b!986600 (= e!556314 (and e!556317 mapRes!36749))))

(declare-fun condMapEmpty!36749 () Bool)

(declare-fun mapDefault!36749 () ValueCell!11092)

