; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!73424 () Bool)

(assert start!73424)

(declare-fun b_free!14339 () Bool)

(declare-fun b_next!14339 () Bool)

(assert (=> start!73424 (= b_free!14339 (not b_next!14339))))

(declare-fun tp!50520 () Bool)

(declare-fun b_and!23695 () Bool)

(assert (=> start!73424 (= tp!50520 b_and!23695)))

(declare-fun b!857226 () Bool)

(declare-fun res!582290 () Bool)

(declare-fun e!477793 () Bool)

(assert (=> b!857226 (=> (not res!582290) (not e!477793))))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!857226 (= res!582290 (validMask!0 mask!1196))))

(declare-fun mapIsEmpty!26312 () Bool)

(declare-fun mapRes!26312 () Bool)

(assert (=> mapIsEmpty!26312 mapRes!26312))

(declare-fun b!857227 () Bool)

(declare-fun res!582286 () Bool)

(assert (=> b!857227 (=> (not res!582286) (not e!477793))))

(declare-datatypes ((array!49142 0))(
  ( (array!49143 (arr!23602 (Array (_ BitVec 32) (_ BitVec 64))) (size!24042 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!49142)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!49142 (_ BitVec 32)) Bool)

(assert (=> b!857227 (= res!582286 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!857228 () Bool)

(declare-fun res!582293 () Bool)

(assert (=> b!857228 (=> (not res!582293) (not e!477793))))

(declare-datatypes ((List!16739 0))(
  ( (Nil!16736) (Cons!16735 (h!17866 (_ BitVec 64)) (t!23380 List!16739)) )
))
(declare-fun arrayNoDuplicates!0 (array!49142 (_ BitVec 32) List!16739) Bool)

(assert (=> b!857228 (= res!582293 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16736))))

(declare-fun b!857229 () Bool)

(declare-fun res!582288 () Bool)

(assert (=> b!857229 (=> (not res!582288) (not e!477793))))

(declare-fun k!854 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!857229 (= res!582288 (validKeyInArray!0 k!854))))

(declare-fun b!857230 () Bool)

(declare-fun e!477796 () Bool)

(declare-fun e!477795 () Bool)

(assert (=> b!857230 (= e!477796 (and e!477795 mapRes!26312))))

(declare-fun condMapEmpty!26312 () Bool)

(declare-datatypes ((V!27013 0))(
  ( (V!27014 (val!8285 Int)) )
))
(declare-datatypes ((ValueCell!7798 0))(
  ( (ValueCellFull!7798 (v!10710 V!27013)) (EmptyCell!7798) )
))
(declare-datatypes ((array!49144 0))(
  ( (array!49145 (arr!23603 (Array (_ BitVec 32) ValueCell!7798)) (size!24043 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!49144)

(declare-fun mapDefault!26312 () ValueCell!7798)

