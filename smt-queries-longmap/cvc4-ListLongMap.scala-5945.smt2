; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!77490 () Bool)

(assert start!77490)

(declare-fun b!902992 () Bool)

(declare-fun e!505862 () Bool)

(declare-fun tp_is_empty!18503 () Bool)

(assert (=> b!902992 (= e!505862 tp_is_empty!18503)))

(declare-fun mapIsEmpty!29464 () Bool)

(declare-fun mapRes!29464 () Bool)

(assert (=> mapIsEmpty!29464 mapRes!29464))

(declare-fun b!902993 () Bool)

(declare-fun e!505860 () Bool)

(assert (=> b!902993 (= e!505860 tp_is_empty!18503)))

(declare-fun res!609291 () Bool)

(declare-fun e!505861 () Bool)

(assert (=> start!77490 (=> (not res!609291) (not e!505861))))

(declare-fun mask!1756 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!77490 (= res!609291 (validMask!0 mask!1756))))

(assert (=> start!77490 e!505861))

(assert (=> start!77490 true))

(declare-datatypes ((V!29635 0))(
  ( (V!29636 (val!9302 Int)) )
))
(declare-datatypes ((ValueCell!8770 0))(
  ( (ValueCellFull!8770 (v!11807 V!29635)) (EmptyCell!8770) )
))
(declare-datatypes ((array!53064 0))(
  ( (array!53065 (arr!25492 (Array (_ BitVec 32) ValueCell!8770)) (size!25951 (_ BitVec 32))) )
))
(declare-fun _values!1152 () array!53064)

(declare-fun e!505859 () Bool)

(declare-fun array_inv!19984 (array!53064) Bool)

(assert (=> start!77490 (and (array_inv!19984 _values!1152) e!505859)))

(declare-datatypes ((array!53066 0))(
  ( (array!53067 (arr!25493 (Array (_ BitVec 32) (_ BitVec 64))) (size!25952 (_ BitVec 32))) )
))
(declare-fun _keys!1386 () array!53066)

(declare-fun array_inv!19985 (array!53066) Bool)

(assert (=> start!77490 (array_inv!19985 _keys!1386)))

(declare-fun mapNonEmpty!29464 () Bool)

(declare-fun tp!56523 () Bool)

(assert (=> mapNonEmpty!29464 (= mapRes!29464 (and tp!56523 e!505860))))

(declare-fun mapValue!29464 () ValueCell!8770)

(declare-fun mapKey!29464 () (_ BitVec 32))

(declare-fun mapRest!29464 () (Array (_ BitVec 32) ValueCell!8770))

(assert (=> mapNonEmpty!29464 (= (arr!25492 _values!1152) (store mapRest!29464 mapKey!29464 mapValue!29464))))

(declare-fun b!902994 () Bool)

(assert (=> b!902994 (= e!505861 false)))

(declare-fun lt!407949 () Bool)

(declare-datatypes ((List!17902 0))(
  ( (Nil!17899) (Cons!17898 (h!19044 (_ BitVec 64)) (t!25285 List!17902)) )
))
(declare-fun arrayNoDuplicates!0 (array!53066 (_ BitVec 32) List!17902) Bool)

(assert (=> b!902994 (= lt!407949 (arrayNoDuplicates!0 _keys!1386 #b00000000000000000000000000000000 Nil!17899))))

(declare-fun b!902995 () Bool)

(declare-fun res!609292 () Bool)

(assert (=> b!902995 (=> (not res!609292) (not e!505861))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!53066 (_ BitVec 32)) Bool)

(assert (=> b!902995 (= res!609292 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1386 mask!1756))))

(declare-fun b!902996 () Bool)

(assert (=> b!902996 (= e!505859 (and e!505862 mapRes!29464))))

(declare-fun condMapEmpty!29464 () Bool)

(declare-fun mapDefault!29464 () ValueCell!8770)

