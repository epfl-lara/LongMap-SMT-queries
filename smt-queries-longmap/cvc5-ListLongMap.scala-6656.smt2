; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!83908 () Bool)

(assert start!83908)

(declare-fun b_free!19717 () Bool)

(declare-fun b_next!19717 () Bool)

(assert (=> start!83908 (= b_free!19717 (not b_next!19717))))

(declare-fun tp!68592 () Bool)

(declare-fun b_and!31523 () Bool)

(assert (=> start!83908 (= tp!68592 b_and!31523)))

(declare-fun b!980591 () Bool)

(declare-fun res!656257 () Bool)

(declare-fun e!552706 () Bool)

(assert (=> b!980591 (=> (not res!656257) (not e!552706))))

(declare-datatypes ((array!61429 0))(
  ( (array!61430 (arr!29572 (Array (_ BitVec 32) (_ BitVec 64))) (size!30051 (_ BitVec 32))) )
))
(declare-fun _keys!1544 () array!61429)

(declare-datatypes ((List!20496 0))(
  ( (Nil!20493) (Cons!20492 (h!21654 (_ BitVec 64)) (t!29169 List!20496)) )
))
(declare-fun arrayNoDuplicates!0 (array!61429 (_ BitVec 32) List!20496) Bool)

(assert (=> b!980591 (= res!656257 (arrayNoDuplicates!0 _keys!1544 #b00000000000000000000000000000000 Nil!20493))))

(declare-fun b!980592 () Bool)

(declare-fun res!656261 () Bool)

(assert (=> b!980592 (=> (not res!656261) (not e!552706))))

(declare-fun mask!1948 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!61429 (_ BitVec 32)) Bool)

(assert (=> b!980592 (= res!656261 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1544 mask!1948))))

(declare-fun b!980593 () Bool)

(declare-fun res!656254 () Bool)

(assert (=> b!980593 (=> (not res!656254) (not e!552706))))

(declare-fun from!1932 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!980593 (= res!656254 (validKeyInArray!0 (select (arr!29572 _keys!1544) from!1932)))))

(declare-fun b!980594 () Bool)

(declare-fun e!552703 () Bool)

(assert (=> b!980594 (= e!552703 true)))

(declare-datatypes ((V!35265 0))(
  ( (V!35266 (val!11406 Int)) )
))
(declare-datatypes ((tuple2!14630 0))(
  ( (tuple2!14631 (_1!7326 (_ BitVec 64)) (_2!7326 V!35265)) )
))
(declare-fun lt!435447 () tuple2!14630)

(declare-datatypes ((List!20497 0))(
  ( (Nil!20494) (Cons!20493 (h!21655 tuple2!14630) (t!29170 List!20497)) )
))
(declare-datatypes ((ListLongMap!13327 0))(
  ( (ListLongMap!13328 (toList!6679 List!20497)) )
))
(declare-fun lt!435446 () ListLongMap!13327)

(declare-fun lt!435445 () tuple2!14630)

(declare-fun lt!435444 () ListLongMap!13327)

(declare-fun +!2984 (ListLongMap!13327 tuple2!14630) ListLongMap!13327)

(assert (=> b!980594 (= lt!435444 (+!2984 (+!2984 lt!435446 lt!435447) lt!435445))))

(declare-fun zeroValue!1220 () V!35265)

(declare-datatypes ((Unit!32607 0))(
  ( (Unit!32608) )
))
(declare-fun lt!435442 () Unit!32607)

(declare-fun lt!435441 () V!35265)

(declare-fun addCommutativeForDiffKeys!612 (ListLongMap!13327 (_ BitVec 64) V!35265 (_ BitVec 64) V!35265) Unit!32607)

(assert (=> b!980594 (= lt!435442 (addCommutativeForDiffKeys!612 lt!435446 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220 (select (arr!29572 _keys!1544) from!1932) lt!435441))))

(declare-fun res!656256 () Bool)

(assert (=> start!83908 (=> (not res!656256) (not e!552706))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!83908 (= res!656256 (validMask!0 mask!1948))))

(assert (=> start!83908 e!552706))

(assert (=> start!83908 true))

(declare-fun tp_is_empty!22711 () Bool)

(assert (=> start!83908 tp_is_empty!22711))

(declare-datatypes ((ValueCell!10874 0))(
  ( (ValueCellFull!10874 (v!13968 V!35265)) (EmptyCell!10874) )
))
(declare-datatypes ((array!61431 0))(
  ( (array!61432 (arr!29573 (Array (_ BitVec 32) ValueCell!10874)) (size!30052 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!61431)

(declare-fun e!552704 () Bool)

(declare-fun array_inv!22861 (array!61431) Bool)

(assert (=> start!83908 (and (array_inv!22861 _values!1278) e!552704)))

(assert (=> start!83908 tp!68592))

(declare-fun array_inv!22862 (array!61429) Bool)

(assert (=> start!83908 (array_inv!22862 _keys!1544)))

(declare-fun b!980595 () Bool)

(declare-fun e!552708 () Bool)

(assert (=> b!980595 (= e!552708 tp_is_empty!22711)))

(declare-fun b!980596 () Bool)

(declare-fun res!656260 () Bool)

(assert (=> b!980596 (=> (not res!656260) (not e!552706))))

(declare-fun extraKeys!1199 () (_ BitVec 32))

(assert (=> b!980596 (= res!656260 (and (not (= (bvand extraKeys!1199 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1199 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!980597 () Bool)

(declare-fun e!552705 () Bool)

(declare-fun mapRes!36095 () Bool)

(assert (=> b!980597 (= e!552704 (and e!552705 mapRes!36095))))

(declare-fun condMapEmpty!36095 () Bool)

(declare-fun mapDefault!36095 () ValueCell!10874)

