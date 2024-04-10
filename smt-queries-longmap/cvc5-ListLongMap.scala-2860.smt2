; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!41190 () Bool)

(assert start!41190)

(declare-fun b_free!11059 () Bool)

(declare-fun b_next!11059 () Bool)

(assert (=> start!41190 (= b_free!11059 (not b_next!11059))))

(declare-fun tp!39012 () Bool)

(declare-fun b_and!19357 () Bool)

(assert (=> start!41190 (= tp!39012 b_and!19357)))

(declare-fun b!460619 () Bool)

(declare-datatypes ((Unit!13412 0))(
  ( (Unit!13413) )
))
(declare-fun e!268717 () Unit!13412)

(declare-fun Unit!13414 () Unit!13412)

(assert (=> b!460619 (= e!268717 Unit!13414)))

(declare-fun mapIsEmpty!20245 () Bool)

(declare-fun mapRes!20245 () Bool)

(assert (=> mapIsEmpty!20245 mapRes!20245))

(declare-fun b!460620 () Bool)

(declare-fun res!275424 () Bool)

(declare-fun e!268719 () Bool)

(assert (=> b!460620 (=> (not res!275424) (not e!268719))))

(declare-datatypes ((array!28593 0))(
  ( (array!28594 (arr!13737 (Array (_ BitVec 32) (_ BitVec 64))) (size!14089 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!28593)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!28593 (_ BitVec 32)) Bool)

(assert (=> b!460620 (= res!275424 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!460621 () Bool)

(declare-fun e!268715 () Bool)

(declare-fun e!268712 () Bool)

(assert (=> b!460621 (= e!268715 (not e!268712))))

(declare-fun res!275421 () Bool)

(assert (=> b!460621 (=> res!275421 e!268712)))

(declare-fun from!863 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!460621 (= res!275421 (not (validKeyInArray!0 (select (arr!13737 _keys!709) from!863))))))

(declare-datatypes ((V!17635 0))(
  ( (V!17636 (val!6243 Int)) )
))
(declare-datatypes ((tuple2!8236 0))(
  ( (tuple2!8237 (_1!4129 (_ BitVec 64)) (_2!4129 V!17635)) )
))
(declare-datatypes ((List!8307 0))(
  ( (Nil!8304) (Cons!8303 (h!9159 tuple2!8236) (t!14245 List!8307)) )
))
(declare-datatypes ((ListLongMap!7149 0))(
  ( (ListLongMap!7150 (toList!3590 List!8307)) )
))
(declare-fun lt!208633 () ListLongMap!7149)

(declare-fun lt!208636 () ListLongMap!7149)

(assert (=> b!460621 (= lt!208633 lt!208636)))

(declare-fun lt!208634 () ListLongMap!7149)

(declare-fun lt!208640 () tuple2!8236)

(declare-fun +!1626 (ListLongMap!7149 tuple2!8236) ListLongMap!7149)

(assert (=> b!460621 (= lt!208636 (+!1626 lt!208634 lt!208640))))

(declare-fun lt!208632 () array!28593)

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun zeroValue!515 () V!17635)

(declare-datatypes ((ValueCell!5855 0))(
  ( (ValueCellFull!5855 (v!8521 V!17635)) (EmptyCell!5855) )
))
(declare-datatypes ((array!28595 0))(
  ( (array!28596 (arr!13738 (Array (_ BitVec 32) ValueCell!5855)) (size!14090 (_ BitVec 32))) )
))
(declare-fun lt!208642 () array!28595)

(declare-fun minValue!515 () V!17635)

(declare-fun getCurrentListMapNoExtraKeys!1770 (array!28593 array!28595 (_ BitVec 32) (_ BitVec 32) V!17635 V!17635 (_ BitVec 32) Int) ListLongMap!7149)

(assert (=> b!460621 (= lt!208633 (getCurrentListMapNoExtraKeys!1770 lt!208632 lt!208642 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun k!794 () (_ BitVec 64))

(declare-fun v!412 () V!17635)

(assert (=> b!460621 (= lt!208640 (tuple2!8237 k!794 v!412))))

(declare-fun _values!549 () array!28595)

(assert (=> b!460621 (= lt!208634 (getCurrentListMapNoExtraKeys!1770 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun lt!208646 () Unit!13412)

(declare-fun i!563 () (_ BitVec 32))

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!782 (array!28593 array!28595 (_ BitVec 32) (_ BitVec 32) V!17635 V!17635 (_ BitVec 32) (_ BitVec 64) V!17635 (_ BitVec 32) Int) Unit!13412)

(assert (=> b!460621 (= lt!208646 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!782 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!460622 () Bool)

(declare-fun res!275418 () Bool)

(declare-fun e!268716 () Bool)

(assert (=> b!460622 (=> (not res!275418) (not e!268716))))

(assert (=> b!460622 (= res!275418 (bvsle from!863 i!563))))

(declare-fun b!460623 () Bool)

(declare-fun res!275426 () Bool)

(assert (=> b!460623 (=> (not res!275426) (not e!268719))))

(assert (=> b!460623 (= res!275426 (and (= (size!14090 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!14089 _keys!709) (size!14090 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!460624 () Bool)

(declare-fun e!268718 () Bool)

(declare-fun tp_is_empty!12397 () Bool)

(assert (=> b!460624 (= e!268718 tp_is_empty!12397)))

(declare-fun b!460625 () Bool)

(declare-fun res!275423 () Bool)

(assert (=> b!460625 (=> (not res!275423) (not e!268719))))

(declare-fun arrayContainsKey!0 (array!28593 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!460625 (= res!275423 (not (arrayContainsKey!0 _keys!709 k!794 #b00000000000000000000000000000000)))))

(declare-fun b!460626 () Bool)

(declare-fun res!275429 () Bool)

(assert (=> b!460626 (=> (not res!275429) (not e!268719))))

(declare-datatypes ((List!8308 0))(
  ( (Nil!8305) (Cons!8304 (h!9160 (_ BitVec 64)) (t!14246 List!8308)) )
))
(declare-fun arrayNoDuplicates!0 (array!28593 (_ BitVec 32) List!8308) Bool)

(assert (=> b!460626 (= res!275429 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!8305))))

(declare-fun res!275419 () Bool)

(assert (=> start!41190 (=> (not res!275419) (not e!268719))))

(assert (=> start!41190 (= res!275419 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!14089 _keys!709))))))

(assert (=> start!41190 e!268719))

(assert (=> start!41190 tp_is_empty!12397))

(assert (=> start!41190 tp!39012))

(assert (=> start!41190 true))

(declare-fun e!268711 () Bool)

(declare-fun array_inv!9934 (array!28595) Bool)

(assert (=> start!41190 (and (array_inv!9934 _values!549) e!268711)))

(declare-fun array_inv!9935 (array!28593) Bool)

(assert (=> start!41190 (array_inv!9935 _keys!709)))

(declare-fun b!460627 () Bool)

(declare-fun res!275430 () Bool)

(assert (=> b!460627 (=> (not res!275430) (not e!268719))))

(assert (=> b!460627 (= res!275430 (or (= (select (arr!13737 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!13737 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun mapNonEmpty!20245 () Bool)

(declare-fun tp!39013 () Bool)

(declare-fun e!268710 () Bool)

(assert (=> mapNonEmpty!20245 (= mapRes!20245 (and tp!39013 e!268710))))

(declare-fun mapRest!20245 () (Array (_ BitVec 32) ValueCell!5855))

(declare-fun mapValue!20245 () ValueCell!5855)

(declare-fun mapKey!20245 () (_ BitVec 32))

(assert (=> mapNonEmpty!20245 (= (arr!13738 _values!549) (store mapRest!20245 mapKey!20245 mapValue!20245))))

(declare-fun b!460628 () Bool)

(assert (=> b!460628 (= e!268716 e!268715)))

(declare-fun res!275428 () Bool)

(assert (=> b!460628 (=> (not res!275428) (not e!268715))))

(assert (=> b!460628 (= res!275428 (and (not (= from!863 i!563)) (bvslt from!863 i!563)))))

(declare-fun lt!208639 () ListLongMap!7149)

(assert (=> b!460628 (= lt!208639 (getCurrentListMapNoExtraKeys!1770 lt!208632 lt!208642 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(assert (=> b!460628 (= lt!208642 (array!28596 (store (arr!13738 _values!549) i!563 (ValueCellFull!5855 v!412)) (size!14090 _values!549)))))

(declare-fun lt!208641 () ListLongMap!7149)

(assert (=> b!460628 (= lt!208641 (getCurrentListMapNoExtraKeys!1770 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!460629 () Bool)

(assert (=> b!460629 (= e!268719 e!268716)))

(declare-fun res!275425 () Bool)

(assert (=> b!460629 (=> (not res!275425) (not e!268716))))

(assert (=> b!460629 (= res!275425 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!208632 mask!1025))))

(assert (=> b!460629 (= lt!208632 (array!28594 (store (arr!13737 _keys!709) i!563 k!794) (size!14089 _keys!709)))))

(declare-fun b!460630 () Bool)

(declare-fun res!275427 () Bool)

(assert (=> b!460630 (=> (not res!275427) (not e!268719))))

(assert (=> b!460630 (= res!275427 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!14089 _keys!709))))))

(declare-fun b!460631 () Bool)

(assert (=> b!460631 (= e!268710 tp_is_empty!12397)))

(declare-fun b!460632 () Bool)

(declare-fun res!275431 () Bool)

(assert (=> b!460632 (=> (not res!275431) (not e!268716))))

(assert (=> b!460632 (= res!275431 (arrayNoDuplicates!0 lt!208632 #b00000000000000000000000000000000 Nil!8305))))

(declare-fun b!460633 () Bool)

(declare-fun Unit!13415 () Unit!13412)

(assert (=> b!460633 (= e!268717 Unit!13415)))

(declare-fun lt!208644 () Unit!13412)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!28593 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!13412)

(assert (=> b!460633 (= lt!208644 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!709 k!794 from!863 #b00000000000000000000000000000000))))

(assert (=> b!460633 false))

(declare-fun e!268714 () Bool)

(declare-fun b!460634 () Bool)

(assert (=> b!460634 (= e!268714 (= lt!208639 (+!1626 lt!208641 lt!208640)))))

(declare-fun lt!208635 () ListLongMap!7149)

(declare-fun lt!208645 () tuple2!8236)

(assert (=> b!460634 (= lt!208635 (+!1626 (+!1626 lt!208634 lt!208645) lt!208640))))

(declare-fun lt!208643 () Unit!13412)

(declare-fun lt!208637 () V!17635)

(declare-fun addCommutativeForDiffKeys!434 (ListLongMap!7149 (_ BitVec 64) V!17635 (_ BitVec 64) V!17635) Unit!13412)

(assert (=> b!460634 (= lt!208643 (addCommutativeForDiffKeys!434 lt!208634 k!794 v!412 (select (arr!13737 _keys!709) from!863) lt!208637))))

(declare-fun b!460635 () Bool)

(declare-fun res!275420 () Bool)

(assert (=> b!460635 (=> (not res!275420) (not e!268719))))

(assert (=> b!460635 (= res!275420 (validKeyInArray!0 k!794))))

(declare-fun b!460636 () Bool)

(assert (=> b!460636 (= e!268711 (and e!268718 mapRes!20245))))

(declare-fun condMapEmpty!20245 () Bool)

(declare-fun mapDefault!20245 () ValueCell!5855)

