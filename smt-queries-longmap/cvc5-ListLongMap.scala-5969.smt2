; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!77640 () Bool)

(assert start!77640)

(declare-fun b_free!16225 () Bool)

(declare-fun b_next!16225 () Bool)

(assert (=> start!77640 (= b_free!16225 (not b_next!16225))))

(declare-fun tp!56937 () Bool)

(declare-fun b_and!26603 () Bool)

(assert (=> start!77640 (= tp!56937 b_and!26603)))

(declare-fun b!905123 () Bool)

(declare-fun e!507197 () Bool)

(declare-fun tp_is_empty!18643 () Bool)

(assert (=> b!905123 (= e!507197 tp_is_empty!18643)))

(declare-fun b!905124 () Bool)

(declare-fun e!507195 () Bool)

(declare-fun e!507196 () Bool)

(assert (=> b!905124 (= e!507195 e!507196)))

(declare-fun res!610763 () Bool)

(assert (=> b!905124 (=> res!610763 e!507196)))

(declare-datatypes ((V!29823 0))(
  ( (V!29824 (val!9372 Int)) )
))
(declare-datatypes ((tuple2!12186 0))(
  ( (tuple2!12187 (_1!6104 (_ BitVec 64)) (_2!6104 V!29823)) )
))
(declare-datatypes ((List!17998 0))(
  ( (Nil!17995) (Cons!17994 (h!19140 tuple2!12186) (t!25395 List!17998)) )
))
(declare-datatypes ((ListLongMap!10883 0))(
  ( (ListLongMap!10884 (toList!5457 List!17998)) )
))
(declare-fun lt!408437 () ListLongMap!10883)

(declare-fun k!1033 () (_ BitVec 64))

(declare-fun contains!4503 (ListLongMap!10883 (_ BitVec 64)) Bool)

(assert (=> b!905124 (= res!610763 (not (contains!4503 lt!408437 k!1033)))))

(declare-datatypes ((ValueCell!8840 0))(
  ( (ValueCellFull!8840 (v!11877 V!29823)) (EmptyCell!8840) )
))
(declare-datatypes ((array!53330 0))(
  ( (array!53331 (arr!25624 (Array (_ BitVec 32) ValueCell!8840)) (size!26083 (_ BitVec 32))) )
))
(declare-fun _values!1152 () array!53330)

(declare-fun defaultEntry!1160 () Int)

(declare-fun mask!1756 () (_ BitVec 32))

(declare-fun zeroValue!1094 () V!29823)

(declare-datatypes ((array!53332 0))(
  ( (array!53333 (arr!25625 (Array (_ BitVec 32) (_ BitVec 64))) (size!26084 (_ BitVec 32))) )
))
(declare-fun _keys!1386 () array!53332)

(declare-fun extraKeys!1073 () (_ BitVec 32))

(declare-fun minValue!1094 () V!29823)

(declare-fun i!717 () (_ BitVec 32))

(declare-fun getCurrentListMap!2724 (array!53332 array!53330 (_ BitVec 32) (_ BitVec 32) V!29823 V!29823 (_ BitVec 32) Int) ListLongMap!10883)

(assert (=> b!905124 (= lt!408437 (getCurrentListMap!2724 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 i!717 defaultEntry!1160))))

(declare-fun b!905125 () Bool)

(declare-fun res!610766 () Bool)

(declare-fun e!507198 () Bool)

(assert (=> b!905125 (=> (not res!610766) (not e!507198))))

(declare-datatypes ((List!17999 0))(
  ( (Nil!17996) (Cons!17995 (h!19141 (_ BitVec 64)) (t!25396 List!17999)) )
))
(declare-fun arrayNoDuplicates!0 (array!53332 (_ BitVec 32) List!17999) Bool)

(assert (=> b!905125 (= res!610766 (arrayNoDuplicates!0 _keys!1386 #b00000000000000000000000000000000 Nil!17996))))

(declare-fun b!905127 () Bool)

(declare-fun res!610764 () Bool)

(assert (=> b!905127 (=> (not res!610764) (not e!507198))))

(assert (=> b!905127 (= res!610764 (and (= (size!26083 _values!1152) (bvadd #b00000000000000000000000000000001 mask!1756)) (= (size!26084 _keys!1386) (size!26083 _values!1152)) (bvsge mask!1756 #b00000000000000000000000000000000) (bvsge extraKeys!1073 #b00000000000000000000000000000000) (bvsle extraKeys!1073 #b00000000000000000000000000000011)))))

(declare-fun b!905128 () Bool)

(declare-fun e!507199 () Bool)

(assert (=> b!905128 (= e!507199 (not e!507195))))

(declare-fun res!610760 () Bool)

(assert (=> b!905128 (=> res!610760 e!507195)))

(assert (=> b!905128 (= res!610760 (or (bvslt i!717 #b00000000000000000000000000000000) (bvsge i!717 (size!26084 _keys!1386))))))

(declare-fun lt!408440 () V!29823)

(declare-fun get!13460 (ValueCell!8840 V!29823) V!29823)

(declare-fun dynLambda!1324 (Int (_ BitVec 64)) V!29823)

(assert (=> b!905128 (= lt!408440 (get!13460 (select (arr!25624 _values!1152) i!717) (dynLambda!1324 defaultEntry!1160 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun arrayContainsKey!0 (array!53332 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!905128 (arrayContainsKey!0 _keys!1386 k!1033 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!30706 0))(
  ( (Unit!30707) )
))
(declare-fun lt!408439 () Unit!30706)

(declare-fun lemmaKeyInListMapIsInArray!196 (array!53332 array!53330 (_ BitVec 32) (_ BitVec 32) V!29823 V!29823 (_ BitVec 64) Int) Unit!30706)

(assert (=> b!905128 (= lt!408439 (lemmaKeyInListMapIsInArray!196 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 k!1033 defaultEntry!1160))))

(declare-fun b!905129 () Bool)

(declare-fun e!507194 () Bool)

(declare-fun e!507200 () Bool)

(declare-fun mapRes!29677 () Bool)

(assert (=> b!905129 (= e!507194 (and e!507200 mapRes!29677))))

(declare-fun condMapEmpty!29677 () Bool)

(declare-fun mapDefault!29677 () ValueCell!8840)

