; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!74352 () Bool)

(assert start!74352)

(declare-fun b_free!15115 () Bool)

(declare-fun b_next!15115 () Bool)

(assert (=> start!74352 (= b_free!15115 (not b_next!15115))))

(declare-fun tp!53019 () Bool)

(declare-fun b_and!24891 () Bool)

(assert (=> start!74352 (= tp!53019 b_and!24891)))

(declare-fun res!594729 () Bool)

(declare-fun e!487181 () Bool)

(assert (=> start!74352 (=> (not res!594729) (not e!487181))))

(declare-fun from!1053 () (_ BitVec 32))

(declare-datatypes ((array!50844 0))(
  ( (array!50845 (arr!24450 (Array (_ BitVec 32) (_ BitVec 64))) (size!24890 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!50844)

(assert (=> start!74352 (= res!594729 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24890 _keys!868))))))

(assert (=> start!74352 e!487181))

(declare-fun tp_is_empty!17359 () Bool)

(assert (=> start!74352 tp_is_empty!17359))

(assert (=> start!74352 true))

(assert (=> start!74352 tp!53019))

(declare-fun array_inv!19274 (array!50844) Bool)

(assert (=> start!74352 (array_inv!19274 _keys!868)))

(declare-datatypes ((V!28193 0))(
  ( (V!28194 (val!8727 Int)) )
))
(declare-datatypes ((ValueCell!8240 0))(
  ( (ValueCellFull!8240 (v!11156 V!28193)) (EmptyCell!8240) )
))
(declare-datatypes ((array!50846 0))(
  ( (array!50847 (arr!24451 (Array (_ BitVec 32) ValueCell!8240)) (size!24891 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!50846)

(declare-fun e!487183 () Bool)

(declare-fun array_inv!19275 (array!50846) Bool)

(assert (=> start!74352 (and (array_inv!19275 _values!688) e!487183)))

(declare-fun b!875107 () Bool)

(declare-fun res!594727 () Bool)

(assert (=> b!875107 (=> (not res!594727) (not e!487181))))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!50844 (_ BitVec 32)) Bool)

(assert (=> b!875107 (= res!594727 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!875108 () Bool)

(declare-fun e!487182 () Bool)

(declare-fun mapRes!27647 () Bool)

(assert (=> b!875108 (= e!487183 (and e!487182 mapRes!27647))))

(declare-fun condMapEmpty!27647 () Bool)

(declare-fun mapDefault!27647 () ValueCell!8240)

