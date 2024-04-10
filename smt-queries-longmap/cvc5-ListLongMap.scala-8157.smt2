; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!99808 () Bool)

(assert start!99808)

(declare-fun b_free!25387 () Bool)

(declare-fun b_next!25387 () Bool)

(assert (=> start!99808 (= b_free!25387 (not b_next!25387))))

(declare-fun tp!88874 () Bool)

(declare-fun b_and!41641 () Bool)

(assert (=> start!99808 (= tp!88874 b_and!41641)))

(declare-fun b!1186283 () Bool)

(declare-fun e!674503 () Bool)

(assert (=> b!1186283 (= e!674503 true)))

(declare-datatypes ((V!45017 0))(
  ( (V!45018 (val!15015 Int)) )
))
(declare-datatypes ((tuple2!19266 0))(
  ( (tuple2!19267 (_1!9644 (_ BitVec 64)) (_2!9644 V!45017)) )
))
(declare-datatypes ((List!26007 0))(
  ( (Nil!26004) (Cons!26003 (h!27212 tuple2!19266) (t!38386 List!26007)) )
))
(declare-datatypes ((ListLongMap!17235 0))(
  ( (ListLongMap!17236 (toList!8633 List!26007)) )
))
(declare-fun lt!538789 () ListLongMap!17235)

(declare-fun k!934 () (_ BitVec 64))

(declare-fun lt!538787 () ListLongMap!17235)

(declare-fun -!1665 (ListLongMap!17235 (_ BitVec 64)) ListLongMap!17235)

(assert (=> b!1186283 (= (-!1665 lt!538789 k!934) lt!538787)))

(declare-datatypes ((array!76629 0))(
  ( (array!76630 (arr!36964 (Array (_ BitVec 32) (_ BitVec 64))) (size!37500 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!76629)

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun lt!538798 () V!45017)

(declare-datatypes ((Unit!39318 0))(
  ( (Unit!39319) )
))
(declare-fun lt!538782 () Unit!39318)

(declare-fun lt!538794 () ListLongMap!17235)

(declare-fun addRemoveCommutativeForDiffKeys!190 (ListLongMap!17235 (_ BitVec 64) V!45017 (_ BitVec 64)) Unit!39318)

(assert (=> b!1186283 (= lt!538782 (addRemoveCommutativeForDiffKeys!190 lt!538794 (select (arr!36964 _keys!1208) from!1455) lt!538798 k!934))))

(declare-fun lt!538784 () ListLongMap!17235)

(declare-fun lt!538788 () ListLongMap!17235)

(declare-fun lt!538796 () ListLongMap!17235)

(assert (=> b!1186283 (and (= lt!538784 lt!538789) (= lt!538788 lt!538796))))

(declare-fun lt!538797 () tuple2!19266)

(declare-fun +!3927 (ListLongMap!17235 tuple2!19266) ListLongMap!17235)

(assert (=> b!1186283 (= lt!538789 (+!3927 lt!538794 lt!538797))))

(assert (=> b!1186283 (not (= (select (arr!36964 _keys!1208) from!1455) k!934))))

(declare-fun lt!538799 () Unit!39318)

(declare-fun e!674504 () Unit!39318)

(assert (=> b!1186283 (= lt!538799 e!674504)))

(declare-fun c!117204 () Bool)

(assert (=> b!1186283 (= c!117204 (= (select (arr!36964 _keys!1208) from!1455) k!934))))

(declare-fun e!674502 () Bool)

(assert (=> b!1186283 e!674502))

(declare-fun res!788616 () Bool)

(assert (=> b!1186283 (=> (not res!788616) (not e!674502))))

(declare-fun lt!538790 () ListLongMap!17235)

(assert (=> b!1186283 (= res!788616 (= lt!538790 lt!538787))))

(assert (=> b!1186283 (= lt!538787 (+!3927 lt!538788 lt!538797))))

(assert (=> b!1186283 (= lt!538797 (tuple2!19267 (select (arr!36964 _keys!1208) from!1455) lt!538798))))

(declare-datatypes ((ValueCell!14249 0))(
  ( (ValueCellFull!14249 (v!17653 V!45017)) (EmptyCell!14249) )
))
(declare-datatypes ((array!76631 0))(
  ( (array!76632 (arr!36965 (Array (_ BitVec 32) ValueCell!14249)) (size!37501 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!76631)

(declare-fun lt!538795 () V!45017)

(declare-fun get!18930 (ValueCell!14249 V!45017) V!45017)

(assert (=> b!1186283 (= lt!538798 (get!18930 (select (arr!36965 _values!996) from!1455) lt!538795))))

(declare-fun b!1186284 () Bool)

(declare-fun res!788612 () Bool)

(declare-fun e!674500 () Bool)

(assert (=> b!1186284 (=> (not res!788612) (not e!674500))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1186284 (= res!788612 (validMask!0 mask!1564))))

(declare-fun b!1186285 () Bool)

(declare-fun e!674496 () Bool)

(declare-fun e!674495 () Bool)

(declare-fun mapRes!46703 () Bool)

(assert (=> b!1186285 (= e!674496 (and e!674495 mapRes!46703))))

(declare-fun condMapEmpty!46703 () Bool)

(declare-fun mapDefault!46703 () ValueCell!14249)

