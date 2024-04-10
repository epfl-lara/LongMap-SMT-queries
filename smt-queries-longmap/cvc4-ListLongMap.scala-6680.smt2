; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!84056 () Bool)

(assert start!84056)

(declare-fun b_free!19811 () Bool)

(declare-fun b_next!19811 () Bool)

(assert (=> start!84056 (= b_free!19811 (not b_next!19811))))

(declare-fun tp!68956 () Bool)

(declare-fun b_and!31705 () Bool)

(assert (=> start!84056 (= tp!68956 b_and!31705)))

(declare-fun mapIsEmpty!36317 () Bool)

(declare-fun mapRes!36317 () Bool)

(assert (=> mapIsEmpty!36317 mapRes!36317))

(declare-fun res!657643 () Bool)

(declare-fun e!553949 () Bool)

(assert (=> start!84056 (=> (not res!657643) (not e!553949))))

(declare-fun mask!1948 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!84056 (= res!657643 (validMask!0 mask!1948))))

(assert (=> start!84056 e!553949))

(assert (=> start!84056 true))

(declare-fun tp_is_empty!22859 () Bool)

(assert (=> start!84056 tp_is_empty!22859))

(declare-datatypes ((V!35461 0))(
  ( (V!35462 (val!11480 Int)) )
))
(declare-datatypes ((ValueCell!10948 0))(
  ( (ValueCellFull!10948 (v!14042 V!35461)) (EmptyCell!10948) )
))
(declare-datatypes ((array!61707 0))(
  ( (array!61708 (arr!29711 (Array (_ BitVec 32) ValueCell!10948)) (size!30190 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!61707)

(declare-fun e!553950 () Bool)

(declare-fun array_inv!22977 (array!61707) Bool)

(assert (=> start!84056 (and (array_inv!22977 _values!1278) e!553950)))

(assert (=> start!84056 tp!68956))

(declare-datatypes ((array!61709 0))(
  ( (array!61710 (arr!29712 (Array (_ BitVec 32) (_ BitVec 64))) (size!30191 (_ BitVec 32))) )
))
(declare-fun _keys!1544 () array!61709)

(declare-fun array_inv!22978 (array!61709) Bool)

(assert (=> start!84056 (array_inv!22978 _keys!1544)))

(declare-fun b!982734 () Bool)

(declare-fun e!553946 () Bool)

(assert (=> b!982734 (= e!553946 (not true))))

(declare-datatypes ((tuple2!14708 0))(
  ( (tuple2!14709 (_1!7365 (_ BitVec 64)) (_2!7365 V!35461)) )
))
(declare-datatypes ((List!20587 0))(
  ( (Nil!20584) (Cons!20583 (h!21745 tuple2!14708) (t!29348 List!20587)) )
))
(declare-datatypes ((ListLongMap!13405 0))(
  ( (ListLongMap!13406 (toList!6718 List!20587)) )
))
(declare-fun lt!436261 () ListLongMap!13405)

(declare-fun lt!436265 () tuple2!14708)

(declare-fun lt!436263 () tuple2!14708)

(declare-fun +!3015 (ListLongMap!13405 tuple2!14708) ListLongMap!13405)

(assert (=> b!982734 (= (+!3015 (+!3015 lt!436261 lt!436265) lt!436263) (+!3015 (+!3015 lt!436261 lt!436263) lt!436265))))

(declare-fun lt!436262 () V!35461)

(declare-fun from!1932 () (_ BitVec 32))

(assert (=> b!982734 (= lt!436263 (tuple2!14709 (select (arr!29712 _keys!1544) from!1932) lt!436262))))

(declare-fun zeroValue!1220 () V!35461)

(assert (=> b!982734 (= lt!436265 (tuple2!14709 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220))))

(declare-datatypes ((Unit!32669 0))(
  ( (Unit!32670) )
))
(declare-fun lt!436264 () Unit!32669)

(declare-fun addCommutativeForDiffKeys!643 (ListLongMap!13405 (_ BitVec 64) V!35461 (_ BitVec 64) V!35461) Unit!32669)

(assert (=> b!982734 (= lt!436264 (addCommutativeForDiffKeys!643 lt!436261 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220 (select (arr!29712 _keys!1544) from!1932) lt!436262))))

(declare-fun b!982735 () Bool)

(declare-fun res!657648 () Bool)

(assert (=> b!982735 (=> (not res!657648) (not e!553949))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!61709 (_ BitVec 32)) Bool)

(assert (=> b!982735 (= res!657648 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1544 mask!1948))))

(declare-fun b!982736 () Bool)

(declare-fun res!657645 () Bool)

(assert (=> b!982736 (=> (not res!657645) (not e!553949))))

(declare-fun extraKeys!1199 () (_ BitVec 32))

(assert (=> b!982736 (= res!657645 (and (= (size!30190 _values!1278) (bvadd #b00000000000000000000000000000001 mask!1948)) (= (size!30191 _keys!1544) (size!30190 _values!1278)) (bvsge mask!1948 #b00000000000000000000000000000000) (bvsge extraKeys!1199 #b00000000000000000000000000000000) (bvsle extraKeys!1199 #b00000000000000000000000000000011)))))

(declare-fun b!982737 () Bool)

(declare-fun res!657646 () Bool)

(assert (=> b!982737 (=> (not res!657646) (not e!553949))))

(assert (=> b!982737 (= res!657646 (and (= (bvand extraKeys!1199 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (not (= (bvand extraKeys!1199 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!982738 () Bool)

(declare-fun res!657650 () Bool)

(assert (=> b!982738 (=> (not res!657650) (not e!553949))))

(declare-datatypes ((List!20588 0))(
  ( (Nil!20585) (Cons!20584 (h!21746 (_ BitVec 64)) (t!29349 List!20588)) )
))
(declare-fun arrayNoDuplicates!0 (array!61709 (_ BitVec 32) List!20588) Bool)

(assert (=> b!982738 (= res!657650 (arrayNoDuplicates!0 _keys!1544 #b00000000000000000000000000000000 Nil!20585))))

(declare-fun b!982739 () Bool)

(declare-fun e!553948 () Bool)

(assert (=> b!982739 (= e!553950 (and e!553948 mapRes!36317))))

(declare-fun condMapEmpty!36317 () Bool)

(declare-fun mapDefault!36317 () ValueCell!10948)

