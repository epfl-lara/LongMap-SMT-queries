; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!83098 () Bool)

(assert start!83098)

(declare-fun b!969326 () Bool)

(declare-fun e!546481 () Bool)

(declare-fun tp_is_empty!21989 () Bool)

(assert (=> b!969326 (= e!546481 tp_is_empty!21989)))

(declare-fun b!969328 () Bool)

(declare-fun res!648786 () Bool)

(declare-fun e!546483 () Bool)

(assert (=> b!969328 (=> (not res!648786) (not e!546483))))

(declare-datatypes ((array!60045 0))(
  ( (array!60046 (arr!28886 (Array (_ BitVec 32) (_ BitVec 64))) (size!29365 (_ BitVec 32))) )
))
(declare-fun _keys!1717 () array!60045)

(declare-fun mask!2147 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!60045 (_ BitVec 32)) Bool)

(assert (=> b!969328 (= res!648786 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1717 mask!2147))))

(declare-fun mapIsEmpty!34993 () Bool)

(declare-fun mapRes!34993 () Bool)

(assert (=> mapIsEmpty!34993 mapRes!34993))

(declare-fun b!969327 () Bool)

(declare-fun e!546484 () Bool)

(assert (=> b!969327 (= e!546484 tp_is_empty!21989)))

(declare-fun res!648784 () Bool)

(assert (=> start!83098 (=> (not res!648784) (not e!546483))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!83098 (= res!648784 (validMask!0 mask!2147))))

(assert (=> start!83098 e!546483))

(assert (=> start!83098 true))

(declare-datatypes ((V!34301 0))(
  ( (V!34302 (val!11045 Int)) )
))
(declare-datatypes ((ValueCell!10513 0))(
  ( (ValueCellFull!10513 (v!13604 V!34301)) (EmptyCell!10513) )
))
(declare-datatypes ((array!60047 0))(
  ( (array!60048 (arr!28887 (Array (_ BitVec 32) ValueCell!10513)) (size!29366 (_ BitVec 32))) )
))
(declare-fun _values!1425 () array!60047)

(declare-fun e!546482 () Bool)

(declare-fun array_inv!22363 (array!60047) Bool)

(assert (=> start!83098 (and (array_inv!22363 _values!1425) e!546482)))

(declare-fun array_inv!22364 (array!60045) Bool)

(assert (=> start!83098 (array_inv!22364 _keys!1717)))

(declare-fun b!969329 () Bool)

(assert (=> b!969329 (= e!546483 false)))

(declare-fun lt!431633 () Bool)

(declare-datatypes ((List!20024 0))(
  ( (Nil!20021) (Cons!20020 (h!21182 (_ BitVec 64)) (t!28387 List!20024)) )
))
(declare-fun arrayNoDuplicates!0 (array!60045 (_ BitVec 32) List!20024) Bool)

(assert (=> b!969329 (= lt!431633 (arrayNoDuplicates!0 _keys!1717 #b00000000000000000000000000000000 Nil!20021))))

(declare-fun b!969330 () Bool)

(declare-fun res!648785 () Bool)

(assert (=> b!969330 (=> (not res!648785) (not e!546483))))

(declare-fun extraKeys!1346 () (_ BitVec 32))

(assert (=> b!969330 (= res!648785 (and (= (size!29366 _values!1425) (bvadd #b00000000000000000000000000000001 mask!2147)) (= (size!29365 _keys!1717) (size!29366 _values!1425)) (bvsge mask!2147 #b00000000000000000000000000000000) (bvsge extraKeys!1346 #b00000000000000000000000000000000) (bvsle extraKeys!1346 #b00000000000000000000000000000011)))))

(declare-fun b!969331 () Bool)

(assert (=> b!969331 (= e!546482 (and e!546481 mapRes!34993))))

(declare-fun condMapEmpty!34993 () Bool)

(declare-fun mapDefault!34993 () ValueCell!10513)

