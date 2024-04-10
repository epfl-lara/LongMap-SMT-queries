; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!83142 () Bool)

(assert start!83142)

(declare-fun b_free!19135 () Bool)

(declare-fun b_next!19135 () Bool)

(assert (=> start!83142 (= b_free!19135 (not b_next!19135))))

(declare-fun tp!66683 () Bool)

(declare-fun b_and!30623 () Bool)

(assert (=> start!83142 (= tp!66683 b_and!30623)))

(declare-fun b!969917 () Bool)

(declare-fun res!649178 () Bool)

(declare-fun e!546812 () Bool)

(assert (=> b!969917 (=> (not res!649178) (not e!546812))))

(declare-datatypes ((array!60127 0))(
  ( (array!60128 (arr!28927 (Array (_ BitVec 32) (_ BitVec 64))) (size!29406 (_ BitVec 32))) )
))
(declare-fun _keys!1717 () array!60127)

(declare-fun i!822 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!969917 (= res!649178 (validKeyInArray!0 (select (arr!28927 _keys!1717) i!822)))))

(declare-fun b!969918 () Bool)

(declare-fun e!546813 () Bool)

(declare-fun tp_is_empty!22033 () Bool)

(assert (=> b!969918 (= e!546813 tp_is_empty!22033)))

(declare-fun b!969919 () Bool)

(declare-fun res!649179 () Bool)

(assert (=> b!969919 (=> (not res!649179) (not e!546812))))

(declare-fun mask!2147 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!60127 (_ BitVec 32)) Bool)

(assert (=> b!969919 (= res!649179 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1717 mask!2147))))

(declare-fun res!649182 () Bool)

(assert (=> start!83142 (=> (not res!649182) (not e!546812))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!83142 (= res!649182 (validMask!0 mask!2147))))

(assert (=> start!83142 e!546812))

(assert (=> start!83142 true))

(declare-datatypes ((V!34361 0))(
  ( (V!34362 (val!11067 Int)) )
))
(declare-datatypes ((ValueCell!10535 0))(
  ( (ValueCellFull!10535 (v!13626 V!34361)) (EmptyCell!10535) )
))
(declare-datatypes ((array!60129 0))(
  ( (array!60130 (arr!28928 (Array (_ BitVec 32) ValueCell!10535)) (size!29407 (_ BitVec 32))) )
))
(declare-fun _values!1425 () array!60129)

(declare-fun e!546814 () Bool)

(declare-fun array_inv!22391 (array!60129) Bool)

(assert (=> start!83142 (and (array_inv!22391 _values!1425) e!546814)))

(assert (=> start!83142 tp_is_empty!22033))

(assert (=> start!83142 tp!66683))

(declare-fun array_inv!22392 (array!60127) Bool)

(assert (=> start!83142 (array_inv!22392 _keys!1717)))

(declare-fun b!969920 () Bool)

(declare-fun res!649177 () Bool)

(assert (=> b!969920 (=> (not res!649177) (not e!546812))))

(declare-datatypes ((List!20047 0))(
  ( (Nil!20044) (Cons!20043 (h!21205 (_ BitVec 64)) (t!28410 List!20047)) )
))
(declare-fun arrayNoDuplicates!0 (array!60127 (_ BitVec 32) List!20047) Bool)

(assert (=> b!969920 (= res!649177 (arrayNoDuplicates!0 _keys!1717 #b00000000000000000000000000000000 Nil!20044))))

(declare-fun b!969921 () Bool)

(declare-fun res!649180 () Bool)

(assert (=> b!969921 (=> (not res!649180) (not e!546812))))

(declare-fun extraKeys!1346 () (_ BitVec 32))

(assert (=> b!969921 (= res!649180 (and (= (size!29407 _values!1425) (bvadd #b00000000000000000000000000000001 mask!2147)) (= (size!29406 _keys!1717) (size!29407 _values!1425)) (bvsge mask!2147 #b00000000000000000000000000000000) (bvsge extraKeys!1346 #b00000000000000000000000000000000) (bvsle extraKeys!1346 #b00000000000000000000000000000011)))))

(declare-fun b!969922 () Bool)

(declare-fun e!546811 () Bool)

(declare-fun mapRes!35059 () Bool)

(assert (=> b!969922 (= e!546814 (and e!546811 mapRes!35059))))

(declare-fun condMapEmpty!35059 () Bool)

(declare-fun mapDefault!35059 () ValueCell!10535)

