; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!82978 () Bool)

(assert start!82978)

(declare-fun res!648376 () Bool)

(declare-fun e!545815 () Bool)

(assert (=> start!82978 (=> (not res!648376) (not e!545815))))

(declare-fun mask!2147 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!82978 (= res!648376 (validMask!0 mask!2147))))

(assert (=> start!82978 e!545815))

(assert (=> start!82978 true))

(declare-datatypes ((V!34201 0))(
  ( (V!34202 (val!11007 Int)) )
))
(declare-datatypes ((ValueCell!10475 0))(
  ( (ValueCellFull!10475 (v!13565 V!34201)) (EmptyCell!10475) )
))
(declare-datatypes ((array!59895 0))(
  ( (array!59896 (arr!28816 (Array (_ BitVec 32) ValueCell!10475)) (size!29295 (_ BitVec 32))) )
))
(declare-fun _values!1425 () array!59895)

(declare-fun e!545819 () Bool)

(declare-fun array_inv!22307 (array!59895) Bool)

(assert (=> start!82978 (and (array_inv!22307 _values!1425) e!545819)))

(declare-datatypes ((array!59897 0))(
  ( (array!59898 (arr!28817 (Array (_ BitVec 32) (_ BitVec 64))) (size!29296 (_ BitVec 32))) )
))
(declare-fun _keys!1717 () array!59897)

(declare-fun array_inv!22308 (array!59897) Bool)

(assert (=> start!82978 (array_inv!22308 _keys!1717)))

(declare-fun mapNonEmpty!34864 () Bool)

(declare-fun mapRes!34864 () Bool)

(declare-fun tp!66432 () Bool)

(declare-fun e!545816 () Bool)

(assert (=> mapNonEmpty!34864 (= mapRes!34864 (and tp!66432 e!545816))))

(declare-fun mapKey!34864 () (_ BitVec 32))

(declare-fun mapValue!34864 () ValueCell!10475)

(declare-fun mapRest!34864 () (Array (_ BitVec 32) ValueCell!10475))

(assert (=> mapNonEmpty!34864 (= (arr!28816 _values!1425) (store mapRest!34864 mapKey!34864 mapValue!34864))))

(declare-fun b!968512 () Bool)

(declare-fun e!545818 () Bool)

(assert (=> b!968512 (= e!545819 (and e!545818 mapRes!34864))))

(declare-fun condMapEmpty!34864 () Bool)

(declare-fun mapDefault!34864 () ValueCell!10475)

