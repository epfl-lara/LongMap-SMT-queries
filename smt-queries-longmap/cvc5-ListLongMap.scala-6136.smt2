; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!78924 () Bool)

(assert start!78924)

(declare-fun b_free!17137 () Bool)

(declare-fun b_next!17137 () Bool)

(assert (=> start!78924 (= b_free!17137 (not b_next!17137))))

(declare-fun tp!59851 () Bool)

(declare-fun b_and!28011 () Bool)

(assert (=> start!78924 (= tp!59851 b_and!28011)))

(declare-fun b!922941 () Bool)

(declare-fun e!517837 () Bool)

(declare-fun e!517838 () Bool)

(assert (=> b!922941 (= e!517837 e!517838)))

(declare-fun res!622363 () Bool)

(assert (=> b!922941 (=> (not res!622363) (not e!517838))))

(declare-fun lt!414530 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!922941 (= res!622363 (validKeyInArray!0 lt!414530))))

(declare-datatypes ((array!55266 0))(
  ( (array!55267 (arr!26578 (Array (_ BitVec 32) (_ BitVec 64))) (size!27037 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!55266)

(declare-fun from!1844 () (_ BitVec 32))

(assert (=> b!922941 (= lt!414530 (select (arr!26578 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun res!622364 () Bool)

(declare-fun e!517834 () Bool)

(assert (=> start!78924 (=> (not res!622364) (not e!517834))))

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!78924 (= res!622364 (validMask!0 mask!1881))))

(assert (=> start!78924 e!517834))

(assert (=> start!78924 true))

(declare-fun tp_is_empty!19645 () Bool)

(assert (=> start!78924 tp_is_empty!19645))

(declare-datatypes ((V!31159 0))(
  ( (V!31160 (val!9873 Int)) )
))
(declare-datatypes ((ValueCell!9341 0))(
  ( (ValueCellFull!9341 (v!12391 V!31159)) (EmptyCell!9341) )
))
(declare-datatypes ((array!55268 0))(
  ( (array!55269 (arr!26579 (Array (_ BitVec 32) ValueCell!9341)) (size!27038 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!55268)

(declare-fun e!517839 () Bool)

(declare-fun array_inv!20702 (array!55268) Bool)

(assert (=> start!78924 (and (array_inv!20702 _values!1231) e!517839)))

(assert (=> start!78924 tp!59851))

(declare-fun array_inv!20703 (array!55266) Bool)

(assert (=> start!78924 (array_inv!20703 _keys!1487)))

(declare-fun b!922942 () Bool)

(declare-fun res!622371 () Bool)

(assert (=> b!922942 (=> (not res!622371) (not e!517834))))

(declare-datatypes ((List!18653 0))(
  ( (Nil!18650) (Cons!18649 (h!19795 (_ BitVec 64)) (t!26520 List!18653)) )
))
(declare-fun arrayNoDuplicates!0 (array!55266 (_ BitVec 32) List!18653) Bool)

(assert (=> b!922942 (= res!622371 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!18650))))

(declare-fun mapIsEmpty!31224 () Bool)

(declare-fun mapRes!31224 () Bool)

(assert (=> mapIsEmpty!31224 mapRes!31224))

(declare-fun e!517836 () Bool)

(declare-fun b!922943 () Bool)

(declare-fun k!1099 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!55266 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!922943 (= e!517836 (arrayContainsKey!0 _keys!1487 k!1099 from!1844))))

(declare-fun b!922944 () Bool)

(declare-fun res!622370 () Bool)

(assert (=> b!922944 (=> (not res!622370) (not e!517834))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!55266 (_ BitVec 32)) Bool)

(assert (=> b!922944 (= res!622370 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun b!922945 () Bool)

(declare-fun e!517833 () Bool)

(assert (=> b!922945 (= e!517839 (and e!517833 mapRes!31224))))

(declare-fun condMapEmpty!31224 () Bool)

(declare-fun mapDefault!31224 () ValueCell!9341)

