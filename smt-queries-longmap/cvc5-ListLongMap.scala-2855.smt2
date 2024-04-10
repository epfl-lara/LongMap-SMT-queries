; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!41160 () Bool)

(assert start!41160)

(declare-fun b_free!11029 () Bool)

(declare-fun b_next!11029 () Bool)

(assert (=> start!41160 (= b_free!11029 (not b_next!11029))))

(declare-fun tp!38922 () Bool)

(declare-fun b_and!19297 () Bool)

(assert (=> start!41160 (= tp!38922 b_and!19297)))

(declare-fun b!459696 () Bool)

(declare-fun e!268274 () Bool)

(declare-fun e!268271 () Bool)

(assert (=> b!459696 (= e!268274 e!268271)))

(declare-fun res!274752 () Bool)

(assert (=> b!459696 (=> (not res!274752) (not e!268271))))

(declare-datatypes ((array!28535 0))(
  ( (array!28536 (arr!13708 (Array (_ BitVec 32) (_ BitVec 64))) (size!14060 (_ BitVec 32))) )
))
(declare-fun lt!207995 () array!28535)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!28535 (_ BitVec 32)) Bool)

(assert (=> b!459696 (= res!274752 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!207995 mask!1025))))

(declare-fun _keys!709 () array!28535)

(declare-fun k!794 () (_ BitVec 64))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!459696 (= lt!207995 (array!28536 (store (arr!13708 _keys!709) i!563 k!794) (size!14060 _keys!709)))))

(declare-fun e!268273 () Bool)

(declare-fun b!459697 () Bool)

(declare-fun from!863 () (_ BitVec 32))

(assert (=> b!459697 (= e!268273 (not (= k!794 (select (arr!13708 _keys!709) from!863))))))

(assert (=> b!459697 (not (= (select (arr!13708 _keys!709) from!863) k!794))))

(declare-datatypes ((Unit!13362 0))(
  ( (Unit!13363) )
))
(declare-fun lt!207998 () Unit!13362)

(declare-fun e!268270 () Unit!13362)

(assert (=> b!459697 (= lt!207998 e!268270)))

(declare-fun c!56492 () Bool)

(assert (=> b!459697 (= c!56492 (= (select (arr!13708 _keys!709) from!863) k!794))))

(declare-datatypes ((V!17595 0))(
  ( (V!17596 (val!6228 Int)) )
))
(declare-datatypes ((tuple2!8212 0))(
  ( (tuple2!8213 (_1!4117 (_ BitVec 64)) (_2!4117 V!17595)) )
))
(declare-datatypes ((List!8283 0))(
  ( (Nil!8280) (Cons!8279 (h!9135 tuple2!8212) (t!14191 List!8283)) )
))
(declare-datatypes ((ListLongMap!7125 0))(
  ( (ListLongMap!7126 (toList!3578 List!8283)) )
))
(declare-fun lt!207992 () ListLongMap!7125)

(declare-fun defaultEntry!557 () Int)

(declare-fun lt!207997 () ListLongMap!7125)

(declare-datatypes ((ValueCell!5840 0))(
  ( (ValueCellFull!5840 (v!8506 V!17595)) (EmptyCell!5840) )
))
(declare-datatypes ((array!28537 0))(
  ( (array!28538 (arr!13709 (Array (_ BitVec 32) ValueCell!5840)) (size!14061 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!28537)

(declare-fun +!1614 (ListLongMap!7125 tuple2!8212) ListLongMap!7125)

(declare-fun get!6764 (ValueCell!5840 V!17595) V!17595)

(declare-fun dynLambda!900 (Int (_ BitVec 64)) V!17595)

(assert (=> b!459697 (= lt!207997 (+!1614 lt!207992 (tuple2!8213 (select (arr!13708 _keys!709) from!863) (get!6764 (select (arr!13709 _values!549) from!863) (dynLambda!900 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!459698 () Bool)

(declare-fun res!274760 () Bool)

(assert (=> b!459698 (=> (not res!274760) (not e!268274))))

(assert (=> b!459698 (= res!274760 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!14060 _keys!709))))))

(declare-fun b!459699 () Bool)

(declare-fun res!274751 () Bool)

(assert (=> b!459699 (=> (not res!274751) (not e!268274))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(assert (=> b!459699 (= res!274751 (and (= (size!14061 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!14060 _keys!709) (size!14061 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!459700 () Bool)

(declare-fun e!268272 () Bool)

(assert (=> b!459700 (= e!268271 e!268272)))

(declare-fun res!274755 () Bool)

(assert (=> b!459700 (=> (not res!274755) (not e!268272))))

(assert (=> b!459700 (= res!274755 (and (not (= from!863 i!563)) (bvslt from!863 i!563)))))

(declare-fun lt!207999 () array!28537)

(declare-fun minValue!515 () V!17595)

(declare-fun zeroValue!515 () V!17595)

(declare-fun getCurrentListMapNoExtraKeys!1758 (array!28535 array!28537 (_ BitVec 32) (_ BitVec 32) V!17595 V!17595 (_ BitVec 32) Int) ListLongMap!7125)

(assert (=> b!459700 (= lt!207997 (getCurrentListMapNoExtraKeys!1758 lt!207995 lt!207999 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun v!412 () V!17595)

(assert (=> b!459700 (= lt!207999 (array!28538 (store (arr!13709 _values!549) i!563 (ValueCellFull!5840 v!412)) (size!14061 _values!549)))))

(declare-fun lt!207994 () ListLongMap!7125)

(assert (=> b!459700 (= lt!207994 (getCurrentListMapNoExtraKeys!1758 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!459702 () Bool)

(declare-fun Unit!13364 () Unit!13362)

(assert (=> b!459702 (= e!268270 Unit!13364)))

(declare-fun lt!207996 () Unit!13362)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!28535 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!13362)

(assert (=> b!459702 (= lt!207996 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!709 k!794 from!863 #b00000000000000000000000000000000))))

(assert (=> b!459702 false))

(declare-fun b!459703 () Bool)

(declare-fun res!274761 () Bool)

(assert (=> b!459703 (=> (not res!274761) (not e!268274))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!459703 (= res!274761 (validKeyInArray!0 k!794))))

(declare-fun b!459704 () Bool)

(declare-fun e!268275 () Bool)

(declare-fun tp_is_empty!12367 () Bool)

(assert (=> b!459704 (= e!268275 tp_is_empty!12367)))

(declare-fun b!459705 () Bool)

(declare-fun res!274759 () Bool)

(assert (=> b!459705 (=> (not res!274759) (not e!268274))))

(assert (=> b!459705 (= res!274759 (or (= (select (arr!13708 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!13708 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!459706 () Bool)

(declare-fun res!274762 () Bool)

(assert (=> b!459706 (=> (not res!274762) (not e!268274))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!459706 (= res!274762 (validMask!0 mask!1025))))

(declare-fun b!459707 () Bool)

(assert (=> b!459707 (= e!268272 (not e!268273))))

(declare-fun res!274750 () Bool)

(assert (=> b!459707 (=> res!274750 e!268273)))

(assert (=> b!459707 (= res!274750 (not (validKeyInArray!0 (select (arr!13708 _keys!709) from!863))))))

(declare-fun lt!208000 () ListLongMap!7125)

(assert (=> b!459707 (= lt!208000 lt!207992)))

(declare-fun lt!207993 () ListLongMap!7125)

(assert (=> b!459707 (= lt!207992 (+!1614 lt!207993 (tuple2!8213 k!794 v!412)))))

(assert (=> b!459707 (= lt!208000 (getCurrentListMapNoExtraKeys!1758 lt!207995 lt!207999 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(assert (=> b!459707 (= lt!207993 (getCurrentListMapNoExtraKeys!1758 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun lt!208001 () Unit!13362)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!770 (array!28535 array!28537 (_ BitVec 32) (_ BitVec 32) V!17595 V!17595 (_ BitVec 32) (_ BitVec 64) V!17595 (_ BitVec 32) Int) Unit!13362)

(assert (=> b!459707 (= lt!208001 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!770 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!459708 () Bool)

(declare-fun res!274749 () Bool)

(assert (=> b!459708 (=> (not res!274749) (not e!268274))))

(declare-fun arrayContainsKey!0 (array!28535 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!459708 (= res!274749 (not (arrayContainsKey!0 _keys!709 k!794 #b00000000000000000000000000000000)))))

(declare-fun b!459709 () Bool)

(declare-fun res!274758 () Bool)

(assert (=> b!459709 (=> (not res!274758) (not e!268271))))

(assert (=> b!459709 (= res!274758 (bvsle from!863 i!563))))

(declare-fun b!459710 () Bool)

(declare-fun res!274753 () Bool)

(assert (=> b!459710 (=> (not res!274753) (not e!268274))))

(declare-datatypes ((List!8284 0))(
  ( (Nil!8281) (Cons!8280 (h!9136 (_ BitVec 64)) (t!14192 List!8284)) )
))
(declare-fun arrayNoDuplicates!0 (array!28535 (_ BitVec 32) List!8284) Bool)

(assert (=> b!459710 (= res!274753 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!8281))))

(declare-fun res!274757 () Bool)

(assert (=> start!41160 (=> (not res!274757) (not e!268274))))

(assert (=> start!41160 (= res!274757 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!14060 _keys!709))))))

(assert (=> start!41160 e!268274))

(assert (=> start!41160 tp_is_empty!12367))

(assert (=> start!41160 tp!38922))

(assert (=> start!41160 true))

(declare-fun e!268269 () Bool)

(declare-fun array_inv!9914 (array!28537) Bool)

(assert (=> start!41160 (and (array_inv!9914 _values!549) e!268269)))

(declare-fun array_inv!9915 (array!28535) Bool)

(assert (=> start!41160 (array_inv!9915 _keys!709)))

(declare-fun b!459701 () Bool)

(declare-fun res!274756 () Bool)

(assert (=> b!459701 (=> (not res!274756) (not e!268271))))

(assert (=> b!459701 (= res!274756 (arrayNoDuplicates!0 lt!207995 #b00000000000000000000000000000000 Nil!8281))))

(declare-fun b!459711 () Bool)

(declare-fun mapRes!20200 () Bool)

(assert (=> b!459711 (= e!268269 (and e!268275 mapRes!20200))))

(declare-fun condMapEmpty!20200 () Bool)

(declare-fun mapDefault!20200 () ValueCell!5840)

