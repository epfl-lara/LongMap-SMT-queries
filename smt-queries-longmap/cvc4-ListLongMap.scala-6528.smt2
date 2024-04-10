; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!83056 () Bool)

(assert start!83056)

(declare-fun res!648595 () Bool)

(declare-fun e!546168 () Bool)

(assert (=> start!83056 (=> (not res!648595) (not e!546168))))

(declare-fun mask!2147 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!83056 (= res!648595 (validMask!0 mask!2147))))

(assert (=> start!83056 e!546168))

(assert (=> start!83056 true))

(declare-datatypes ((V!34245 0))(
  ( (V!34246 (val!11024 Int)) )
))
(declare-datatypes ((ValueCell!10492 0))(
  ( (ValueCellFull!10492 (v!13583 V!34245)) (EmptyCell!10492) )
))
(declare-datatypes ((array!59967 0))(
  ( (array!59968 (arr!28847 (Array (_ BitVec 32) ValueCell!10492)) (size!29326 (_ BitVec 32))) )
))
(declare-fun _values!1425 () array!59967)

(declare-fun e!546165 () Bool)

(declare-fun array_inv!22331 (array!59967) Bool)

(assert (=> start!83056 (and (array_inv!22331 _values!1425) e!546165)))

(declare-datatypes ((array!59969 0))(
  ( (array!59970 (arr!28848 (Array (_ BitVec 32) (_ BitVec 64))) (size!29327 (_ BitVec 32))) )
))
(declare-fun _keys!1717 () array!59969)

(declare-fun array_inv!22332 (array!59969) Bool)

(assert (=> start!83056 (array_inv!22332 _keys!1717)))

(declare-fun b!968948 () Bool)

(assert (=> b!968948 (= e!546168 false)))

(declare-fun lt!431570 () Bool)

(declare-datatypes ((List!20008 0))(
  ( (Nil!20005) (Cons!20004 (h!21166 (_ BitVec 64)) (t!28371 List!20008)) )
))
(declare-fun arrayNoDuplicates!0 (array!59969 (_ BitVec 32) List!20008) Bool)

(assert (=> b!968948 (= lt!431570 (arrayNoDuplicates!0 _keys!1717 #b00000000000000000000000000000000 Nil!20005))))

(declare-fun mapNonEmpty!34930 () Bool)

(declare-fun mapRes!34930 () Bool)

(declare-fun tp!66498 () Bool)

(declare-fun e!546169 () Bool)

(assert (=> mapNonEmpty!34930 (= mapRes!34930 (and tp!66498 e!546169))))

(declare-fun mapRest!34930 () (Array (_ BitVec 32) ValueCell!10492))

(declare-fun mapValue!34930 () ValueCell!10492)

(declare-fun mapKey!34930 () (_ BitVec 32))

(assert (=> mapNonEmpty!34930 (= (arr!28847 _values!1425) (store mapRest!34930 mapKey!34930 mapValue!34930))))

(declare-fun b!968949 () Bool)

(declare-fun tp_is_empty!21947 () Bool)

(assert (=> b!968949 (= e!546169 tp_is_empty!21947)))

(declare-fun mapIsEmpty!34930 () Bool)

(assert (=> mapIsEmpty!34930 mapRes!34930))

(declare-fun b!968950 () Bool)

(declare-fun res!648597 () Bool)

(assert (=> b!968950 (=> (not res!648597) (not e!546168))))

(declare-fun extraKeys!1346 () (_ BitVec 32))

(assert (=> b!968950 (= res!648597 (and (= (size!29326 _values!1425) (bvadd #b00000000000000000000000000000001 mask!2147)) (= (size!29327 _keys!1717) (size!29326 _values!1425)) (bvsge mask!2147 #b00000000000000000000000000000000) (bvsge extraKeys!1346 #b00000000000000000000000000000000) (bvsle extraKeys!1346 #b00000000000000000000000000000011)))))

(declare-fun b!968951 () Bool)

(declare-fun res!648596 () Bool)

(assert (=> b!968951 (=> (not res!648596) (not e!546168))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!59969 (_ BitVec 32)) Bool)

(assert (=> b!968951 (= res!648596 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1717 mask!2147))))

(declare-fun b!968952 () Bool)

(declare-fun e!546167 () Bool)

(assert (=> b!968952 (= e!546167 tp_is_empty!21947)))

(declare-fun b!968953 () Bool)

(assert (=> b!968953 (= e!546165 (and e!546167 mapRes!34930))))

(declare-fun condMapEmpty!34930 () Bool)

(declare-fun mapDefault!34930 () ValueCell!10492)

