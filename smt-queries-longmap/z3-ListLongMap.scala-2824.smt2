; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!40910 () Bool)

(assert start!40910)

(declare-fun b_free!10845 () Bool)

(declare-fun b_next!10845 () Bool)

(assert (=> start!40910 (= b_free!10845 (not b_next!10845))))

(declare-fun tp!38361 () Bool)

(declare-fun b_and!18987 () Bool)

(assert (=> start!40910 (= tp!38361 b_and!18987)))

(declare-fun mapIsEmpty!19915 () Bool)

(declare-fun mapRes!19915 () Bool)

(assert (=> mapIsEmpty!19915 mapRes!19915))

(declare-fun res!270924 () Bool)

(declare-fun e!265963 () Bool)

(assert (=> start!40910 (=> (not res!270924) (not e!265963))))

(declare-fun from!863 () (_ BitVec 32))

(declare-datatypes ((array!28171 0))(
  ( (array!28172 (arr!13529 (Array (_ BitVec 32) (_ BitVec 64))) (size!13881 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!28171)

(assert (=> start!40910 (= res!270924 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13881 _keys!709))))))

(assert (=> start!40910 e!265963))

(declare-fun tp_is_empty!12183 () Bool)

(assert (=> start!40910 tp_is_empty!12183))

(assert (=> start!40910 tp!38361))

(assert (=> start!40910 true))

(declare-datatypes ((V!17349 0))(
  ( (V!17350 (val!6136 Int)) )
))
(declare-datatypes ((ValueCell!5748 0))(
  ( (ValueCellFull!5748 (v!8402 V!17349)) (EmptyCell!5748) )
))
(declare-datatypes ((array!28173 0))(
  ( (array!28174 (arr!13530 (Array (_ BitVec 32) ValueCell!5748)) (size!13882 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!28173)

(declare-fun e!265962 () Bool)

(declare-fun array_inv!9800 (array!28173) Bool)

(assert (=> start!40910 (and (array_inv!9800 _values!549) e!265962)))

(declare-fun array_inv!9801 (array!28171) Bool)

(assert (=> start!40910 (array_inv!9801 _keys!709)))

(declare-fun mapNonEmpty!19915 () Bool)

(declare-fun tp!38362 () Bool)

(declare-fun e!265960 () Bool)

(assert (=> mapNonEmpty!19915 (= mapRes!19915 (and tp!38362 e!265960))))

(declare-fun mapKey!19915 () (_ BitVec 32))

(declare-fun mapValue!19915 () ValueCell!5748)

(declare-fun mapRest!19915 () (Array (_ BitVec 32) ValueCell!5748))

(assert (=> mapNonEmpty!19915 (= (arr!13530 _values!549) (store mapRest!19915 mapKey!19915 mapValue!19915))))

(declare-fun b!454637 () Bool)

(declare-fun res!270927 () Bool)

(assert (=> b!454637 (=> (not res!270927) (not e!265963))))

(declare-datatypes ((List!8146 0))(
  ( (Nil!8143) (Cons!8142 (h!8998 (_ BitVec 64)) (t!13974 List!8146)) )
))
(declare-fun arrayNoDuplicates!0 (array!28171 (_ BitVec 32) List!8146) Bool)

(assert (=> b!454637 (= res!270927 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!8143))))

(declare-fun b!454638 () Bool)

(declare-fun res!270929 () Bool)

(assert (=> b!454638 (=> (not res!270929) (not e!265963))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun mask!1025 () (_ BitVec 32))

(assert (=> b!454638 (= res!270929 (and (= (size!13882 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13881 _keys!709) (size!13882 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!454639 () Bool)

(declare-fun res!270934 () Bool)

(declare-fun e!265959 () Bool)

(assert (=> b!454639 (=> (not res!270934) (not e!265959))))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!454639 (= res!270934 (bvsle from!863 i!563))))

(declare-fun b!454640 () Bool)

(assert (=> b!454640 (= e!265963 e!265959)))

(declare-fun res!270935 () Bool)

(assert (=> b!454640 (=> (not res!270935) (not e!265959))))

(declare-fun lt!206177 () array!28171)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!28171 (_ BitVec 32)) Bool)

(assert (=> b!454640 (= res!270935 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!206177 mask!1025))))

(declare-fun k0!794 () (_ BitVec 64))

(assert (=> b!454640 (= lt!206177 (array!28172 (store (arr!13529 _keys!709) i!563 k0!794) (size!13881 _keys!709)))))

(declare-fun b!454641 () Bool)

(assert (=> b!454641 (= e!265959 false)))

(declare-fun minValue!515 () V!17349)

(declare-fun defaultEntry!557 () Int)

(declare-fun zeroValue!515 () V!17349)

(declare-fun v!412 () V!17349)

(declare-datatypes ((tuple2!8084 0))(
  ( (tuple2!8085 (_1!4053 (_ BitVec 64)) (_2!4053 V!17349)) )
))
(declare-datatypes ((List!8147 0))(
  ( (Nil!8144) (Cons!8143 (h!8999 tuple2!8084) (t!13975 List!8147)) )
))
(declare-datatypes ((ListLongMap!6997 0))(
  ( (ListLongMap!6998 (toList!3514 List!8147)) )
))
(declare-fun lt!206176 () ListLongMap!6997)

(declare-fun getCurrentListMapNoExtraKeys!1697 (array!28171 array!28173 (_ BitVec 32) (_ BitVec 32) V!17349 V!17349 (_ BitVec 32) Int) ListLongMap!6997)

(assert (=> b!454641 (= lt!206176 (getCurrentListMapNoExtraKeys!1697 lt!206177 (array!28174 (store (arr!13530 _values!549) i!563 (ValueCellFull!5748 v!412)) (size!13882 _values!549)) mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun lt!206175 () ListLongMap!6997)

(assert (=> b!454641 (= lt!206175 (getCurrentListMapNoExtraKeys!1697 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!454642 () Bool)

(declare-fun res!270932 () Bool)

(assert (=> b!454642 (=> (not res!270932) (not e!265963))))

(assert (=> b!454642 (= res!270932 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!454643 () Bool)

(declare-fun res!270930 () Bool)

(assert (=> b!454643 (=> (not res!270930) (not e!265963))))

(assert (=> b!454643 (= res!270930 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13881 _keys!709))))))

(declare-fun b!454644 () Bool)

(declare-fun e!265961 () Bool)

(assert (=> b!454644 (= e!265961 tp_is_empty!12183)))

(declare-fun b!454645 () Bool)

(assert (=> b!454645 (= e!265960 tp_is_empty!12183)))

(declare-fun b!454646 () Bool)

(assert (=> b!454646 (= e!265962 (and e!265961 mapRes!19915))))

(declare-fun condMapEmpty!19915 () Bool)

(declare-fun mapDefault!19915 () ValueCell!5748)

(assert (=> b!454646 (= condMapEmpty!19915 (= (arr!13530 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5748)) mapDefault!19915)))))

(declare-fun b!454647 () Bool)

(declare-fun res!270928 () Bool)

(assert (=> b!454647 (=> (not res!270928) (not e!265963))))

(declare-fun arrayContainsKey!0 (array!28171 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!454647 (= res!270928 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!454648 () Bool)

(declare-fun res!270931 () Bool)

(assert (=> b!454648 (=> (not res!270931) (not e!265959))))

(assert (=> b!454648 (= res!270931 (arrayNoDuplicates!0 lt!206177 #b00000000000000000000000000000000 Nil!8143))))

(declare-fun b!454649 () Bool)

(declare-fun res!270926 () Bool)

(assert (=> b!454649 (=> (not res!270926) (not e!265963))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!454649 (= res!270926 (validMask!0 mask!1025))))

(declare-fun b!454650 () Bool)

(declare-fun res!270925 () Bool)

(assert (=> b!454650 (=> (not res!270925) (not e!265963))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!454650 (= res!270925 (validKeyInArray!0 k0!794))))

(declare-fun b!454651 () Bool)

(declare-fun res!270933 () Bool)

(assert (=> b!454651 (=> (not res!270933) (not e!265963))))

(assert (=> b!454651 (= res!270933 (or (= (select (arr!13529 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!13529 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!40910 res!270924) b!454649))

(assert (= (and b!454649 res!270926) b!454638))

(assert (= (and b!454638 res!270929) b!454642))

(assert (= (and b!454642 res!270932) b!454637))

(assert (= (and b!454637 res!270927) b!454643))

(assert (= (and b!454643 res!270930) b!454650))

(assert (= (and b!454650 res!270925) b!454651))

(assert (= (and b!454651 res!270933) b!454647))

(assert (= (and b!454647 res!270928) b!454640))

(assert (= (and b!454640 res!270935) b!454648))

(assert (= (and b!454648 res!270931) b!454639))

(assert (= (and b!454639 res!270934) b!454641))

(assert (= (and b!454646 condMapEmpty!19915) mapIsEmpty!19915))

(assert (= (and b!454646 (not condMapEmpty!19915)) mapNonEmpty!19915))

(get-info :version)

(assert (= (and mapNonEmpty!19915 ((_ is ValueCellFull!5748) mapValue!19915)) b!454645))

(assert (= (and b!454646 ((_ is ValueCellFull!5748) mapDefault!19915)) b!454644))

(assert (= start!40910 b!454646))

(declare-fun m!438691 () Bool)

(assert (=> mapNonEmpty!19915 m!438691))

(declare-fun m!438693 () Bool)

(assert (=> b!454647 m!438693))

(declare-fun m!438695 () Bool)

(assert (=> b!454641 m!438695))

(declare-fun m!438697 () Bool)

(assert (=> b!454641 m!438697))

(declare-fun m!438699 () Bool)

(assert (=> b!454641 m!438699))

(declare-fun m!438701 () Bool)

(assert (=> b!454649 m!438701))

(declare-fun m!438703 () Bool)

(assert (=> b!454637 m!438703))

(declare-fun m!438705 () Bool)

(assert (=> b!454651 m!438705))

(declare-fun m!438707 () Bool)

(assert (=> start!40910 m!438707))

(declare-fun m!438709 () Bool)

(assert (=> start!40910 m!438709))

(declare-fun m!438711 () Bool)

(assert (=> b!454640 m!438711))

(declare-fun m!438713 () Bool)

(assert (=> b!454640 m!438713))

(declare-fun m!438715 () Bool)

(assert (=> b!454642 m!438715))

(declare-fun m!438717 () Bool)

(assert (=> b!454648 m!438717))

(declare-fun m!438719 () Bool)

(assert (=> b!454650 m!438719))

(check-sat b_and!18987 (not b!454647) (not b!454640) (not b!454649) (not mapNonEmpty!19915) (not start!40910) (not b!454637) tp_is_empty!12183 (not b_next!10845) (not b!454650) (not b!454648) (not b!454642) (not b!454641))
(check-sat b_and!18987 (not b_next!10845))
