; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!79880 () Bool)

(assert start!79880)

(declare-fun b_free!17777 () Bool)

(declare-fun b_next!17777 () Bool)

(assert (=> start!79880 (= b_free!17777 (not b_next!17777))))

(declare-fun tp!61795 () Bool)

(declare-fun b_and!29189 () Bool)

(assert (=> start!79880 (= tp!61795 b_and!29189)))

(declare-fun b!939510 () Bool)

(declare-fun res!631941 () Bool)

(declare-fun e!527706 () Bool)

(assert (=> b!939510 (=> (not res!631941) (not e!527706))))

(declare-datatypes ((array!56512 0))(
  ( (array!56513 (arr!27194 (Array (_ BitVec 32) (_ BitVec 64))) (size!27653 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!56512)

(declare-datatypes ((List!19177 0))(
  ( (Nil!19174) (Cons!19173 (h!20319 (_ BitVec 64)) (t!27492 List!19177)) )
))
(declare-fun arrayNoDuplicates!0 (array!56512 (_ BitVec 32) List!19177) Bool)

(assert (=> b!939510 (= res!631941 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!19174))))

(declare-fun b!939511 () Bool)

(declare-fun res!631940 () Bool)

(assert (=> b!939511 (=> (not res!631940) (not e!527706))))

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!56512 (_ BitVec 32)) Bool)

(assert (=> b!939511 (= res!631940 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun mapNonEmpty!32207 () Bool)

(declare-fun mapRes!32207 () Bool)

(declare-fun tp!61794 () Bool)

(declare-fun e!527704 () Bool)

(assert (=> mapNonEmpty!32207 (= mapRes!32207 (and tp!61794 e!527704))))

(declare-fun mapKey!32207 () (_ BitVec 32))

(declare-datatypes ((V!32011 0))(
  ( (V!32012 (val!10193 Int)) )
))
(declare-datatypes ((ValueCell!9661 0))(
  ( (ValueCellFull!9661 (v!12724 V!32011)) (EmptyCell!9661) )
))
(declare-fun mapRest!32207 () (Array (_ BitVec 32) ValueCell!9661))

(declare-datatypes ((array!56514 0))(
  ( (array!56515 (arr!27195 (Array (_ BitVec 32) ValueCell!9661)) (size!27654 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!56514)

(declare-fun mapValue!32207 () ValueCell!9661)

(assert (=> mapNonEmpty!32207 (= (arr!27195 _values!1231) (store mapRest!32207 mapKey!32207 mapValue!32207))))

(declare-fun k!1099 () (_ BitVec 64))

(declare-fun v!791 () V!32011)

(declare-fun b!939512 () Bool)

(declare-fun e!527709 () Bool)

(declare-datatypes ((tuple2!13400 0))(
  ( (tuple2!13401 (_1!6711 (_ BitVec 64)) (_2!6711 V!32011)) )
))
(declare-datatypes ((List!19178 0))(
  ( (Nil!19175) (Cons!19174 (h!20320 tuple2!13400) (t!27493 List!19178)) )
))
(declare-datatypes ((ListLongMap!12097 0))(
  ( (ListLongMap!12098 (toList!6064 List!19178)) )
))
(declare-fun lt!424545 () ListLongMap!12097)

(declare-fun apply!865 (ListLongMap!12097 (_ BitVec 64)) V!32011)

(assert (=> b!939512 (= e!527709 (not (= (apply!865 lt!424545 k!1099) v!791)))))

(declare-fun res!631944 () Bool)

(assert (=> start!79880 (=> (not res!631944) (not e!527706))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!79880 (= res!631944 (validMask!0 mask!1881))))

(assert (=> start!79880 e!527706))

(assert (=> start!79880 true))

(declare-fun tp_is_empty!20285 () Bool)

(assert (=> start!79880 tp_is_empty!20285))

(declare-fun e!527708 () Bool)

(declare-fun array_inv!21150 (array!56514) Bool)

(assert (=> start!79880 (and (array_inv!21150 _values!1231) e!527708)))

(assert (=> start!79880 tp!61795))

(declare-fun array_inv!21151 (array!56512) Bool)

(assert (=> start!79880 (array_inv!21151 _keys!1487)))

(declare-fun mapIsEmpty!32207 () Bool)

(assert (=> mapIsEmpty!32207 mapRes!32207))

(declare-fun b!939513 () Bool)

(declare-fun e!527705 () Bool)

(assert (=> b!939513 (= e!527705 e!527709)))

(declare-fun res!631939 () Bool)

(assert (=> b!939513 (=> res!631939 e!527709)))

(declare-fun contains!5126 (ListLongMap!12097 (_ BitVec 64)) Bool)

(assert (=> b!939513 (= res!631939 (not (contains!5126 lt!424545 k!1099)))))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(declare-fun zeroValue!1173 () V!32011)

(declare-fun minValue!1173 () V!32011)

(declare-fun defaultEntry!1235 () Int)

(declare-fun getCurrentListMap!3298 (array!56512 array!56514 (_ BitVec 32) (_ BitVec 32) V!32011 V!32011 (_ BitVec 32) Int) ListLongMap!12097)

(assert (=> b!939513 (= lt!424545 (getCurrentListMap!3298 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 #b00000000000000000000000000000000 defaultEntry!1235))))

(declare-fun b!939514 () Bool)

(declare-fun res!631943 () Bool)

(assert (=> b!939514 (=> (not res!631943) (not e!527705))))

(declare-fun from!1844 () (_ BitVec 32))

(assert (=> b!939514 (= res!631943 (bvsle from!1844 #b00000000000000000000000000000000))))

(declare-fun b!939515 () Bool)

(declare-fun e!527707 () Bool)

(assert (=> b!939515 (= e!527708 (and e!527707 mapRes!32207))))

(declare-fun condMapEmpty!32207 () Bool)

(declare-fun mapDefault!32207 () ValueCell!9661)

