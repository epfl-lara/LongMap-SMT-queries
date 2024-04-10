; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!84446 () Bool)

(assert start!84446)

(declare-fun b_free!19997 () Bool)

(declare-fun b_next!19997 () Bool)

(assert (=> start!84446 (= b_free!19997 (not b_next!19997))))

(declare-fun tp!69772 () Bool)

(declare-fun b_and!32061 () Bool)

(assert (=> start!84446 (= tp!69772 b_and!32061)))

(declare-fun b!987665 () Bool)

(declare-fun e!556929 () Bool)

(declare-fun tp_is_empty!23213 () Bool)

(assert (=> b!987665 (= e!556929 tp_is_empty!23213)))

(declare-fun b!987666 () Bool)

(declare-fun e!556928 () Bool)

(assert (=> b!987666 (= e!556928 true)))

(declare-fun mask!1948 () (_ BitVec 32))

(declare-datatypes ((V!35933 0))(
  ( (V!35934 (val!11657 Int)) )
))
(declare-fun minValue!1220 () V!35933)

(declare-datatypes ((ValueCell!11125 0))(
  ( (ValueCellFull!11125 (v!14221 V!35933)) (EmptyCell!11125) )
))
(declare-datatypes ((array!62385 0))(
  ( (array!62386 (arr!30048 (Array (_ BitVec 32) ValueCell!11125)) (size!30527 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!62385)

(declare-fun extraKeys!1199 () (_ BitVec 32))

(declare-fun zeroValue!1220 () V!35933)

(declare-fun defaultEntry!1281 () Int)

(declare-fun from!1932 () (_ BitVec 32))

(declare-datatypes ((array!62387 0))(
  ( (array!62388 (arr!30049 (Array (_ BitVec 32) (_ BitVec 64))) (size!30528 (_ BitVec 32))) )
))
(declare-fun _keys!1544 () array!62387)

(declare-datatypes ((tuple2!14850 0))(
  ( (tuple2!14851 (_1!7436 (_ BitVec 64)) (_2!7436 V!35933)) )
))
(declare-datatypes ((List!20781 0))(
  ( (Nil!20778) (Cons!20777 (h!21939 tuple2!14850) (t!29706 List!20781)) )
))
(declare-datatypes ((ListLongMap!13547 0))(
  ( (ListLongMap!13548 (toList!6789 List!20781)) )
))
(declare-fun lt!437911 () ListLongMap!13547)

(declare-fun getCurrentListMap!3856 (array!62387 array!62385 (_ BitVec 32) (_ BitVec 32) V!35933 V!35933 (_ BitVec 32) Int) ListLongMap!13547)

(assert (=> b!987666 (= lt!437911 (getCurrentListMap!3856 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281))))

(declare-fun lt!437913 () ListLongMap!13547)

(declare-fun lt!437915 () tuple2!14850)

(declare-fun lt!437914 () ListLongMap!13547)

(declare-fun lt!437910 () tuple2!14850)

(declare-fun +!3074 (ListLongMap!13547 tuple2!14850) ListLongMap!13547)

(assert (=> b!987666 (= lt!437913 (+!3074 (+!3074 lt!437914 lt!437910) lt!437915))))

(declare-fun lt!437906 () V!35933)

(declare-datatypes ((Unit!32781 0))(
  ( (Unit!32782) )
))
(declare-fun lt!437909 () Unit!32781)

(declare-fun addCommutativeForDiffKeys!698 (ListLongMap!13547 (_ BitVec 64) V!35933 (_ BitVec 64) V!35933) Unit!32781)

(assert (=> b!987666 (= lt!437909 (addCommutativeForDiffKeys!698 lt!437914 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220 (select (arr!30049 _keys!1544) from!1932) lt!437906))))

(declare-fun b!987667 () Bool)

(declare-fun res!660727 () Bool)

(declare-fun e!556927 () Bool)

(assert (=> b!987667 (=> (not res!660727) (not e!556927))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!987667 (= res!660727 (validKeyInArray!0 (select (arr!30049 _keys!1544) from!1932)))))

(declare-fun b!987668 () Bool)

(declare-fun e!556930 () Bool)

(assert (=> b!987668 (= e!556930 tp_is_empty!23213)))

(declare-fun b!987669 () Bool)

(declare-fun res!660726 () Bool)

(assert (=> b!987669 (=> (not res!660726) (not e!556927))))

(assert (=> b!987669 (= res!660726 (and (not (= (bvand extraKeys!1199 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1199 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!987670 () Bool)

(declare-fun res!660729 () Bool)

(assert (=> b!987670 (=> (not res!660729) (not e!556927))))

(assert (=> b!987670 (= res!660729 (and (bvsge from!1932 #b00000000000000000000000000000000) (bvslt from!1932 (size!30528 _keys!1544))))))

(declare-fun mapNonEmpty!36854 () Bool)

(declare-fun mapRes!36854 () Bool)

(declare-fun tp!69771 () Bool)

(assert (=> mapNonEmpty!36854 (= mapRes!36854 (and tp!69771 e!556929))))

(declare-fun mapValue!36854 () ValueCell!11125)

(declare-fun mapRest!36854 () (Array (_ BitVec 32) ValueCell!11125))

(declare-fun mapKey!36854 () (_ BitVec 32))

(assert (=> mapNonEmpty!36854 (= (arr!30048 _values!1278) (store mapRest!36854 mapKey!36854 mapValue!36854))))

(declare-fun b!987671 () Bool)

(declare-fun res!660724 () Bool)

(assert (=> b!987671 (=> (not res!660724) (not e!556927))))

(assert (=> b!987671 (= res!660724 (and (= (size!30527 _values!1278) (bvadd #b00000000000000000000000000000001 mask!1948)) (= (size!30528 _keys!1544) (size!30527 _values!1278)) (bvsge mask!1948 #b00000000000000000000000000000000) (bvsge extraKeys!1199 #b00000000000000000000000000000000) (bvsle extraKeys!1199 #b00000000000000000000000000000011)))))

(declare-fun b!987672 () Bool)

(declare-fun res!660725 () Bool)

(assert (=> b!987672 (=> (not res!660725) (not e!556927))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!62387 (_ BitVec 32)) Bool)

(assert (=> b!987672 (= res!660725 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1544 mask!1948))))

(declare-fun res!660728 () Bool)

(assert (=> start!84446 (=> (not res!660728) (not e!556927))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!84446 (= res!660728 (validMask!0 mask!1948))))

(assert (=> start!84446 e!556927))

(assert (=> start!84446 true))

(assert (=> start!84446 tp_is_empty!23213))

(declare-fun e!556926 () Bool)

(declare-fun array_inv!23217 (array!62385) Bool)

(assert (=> start!84446 (and (array_inv!23217 _values!1278) e!556926)))

(assert (=> start!84446 tp!69772))

(declare-fun array_inv!23218 (array!62387) Bool)

(assert (=> start!84446 (array_inv!23218 _keys!1544)))

(declare-fun mapIsEmpty!36854 () Bool)

(assert (=> mapIsEmpty!36854 mapRes!36854))

(declare-fun b!987673 () Bool)

(assert (=> b!987673 (= e!556927 (not e!556928))))

(declare-fun res!660730 () Bool)

(assert (=> b!987673 (=> res!660730 e!556928)))

(assert (=> b!987673 (= res!660730 (= #b0000000000000000000000000000000000000000000000000000000000000000 (select (arr!30049 _keys!1544) from!1932)))))

(declare-fun lt!437908 () ListLongMap!13547)

(declare-fun lt!437912 () tuple2!14850)

(assert (=> b!987673 (= (+!3074 lt!437908 lt!437910) (+!3074 lt!437913 lt!437912))))

(declare-fun lt!437916 () ListLongMap!13547)

(assert (=> b!987673 (= lt!437913 (+!3074 lt!437916 lt!437910))))

(assert (=> b!987673 (= lt!437910 (tuple2!14851 (select (arr!30049 _keys!1544) from!1932) lt!437906))))

(assert (=> b!987673 (= lt!437908 (+!3074 lt!437916 lt!437912))))

(assert (=> b!987673 (= lt!437912 (tuple2!14851 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220))))

(declare-fun lt!437907 () Unit!32781)

(assert (=> b!987673 (= lt!437907 (addCommutativeForDiffKeys!698 lt!437916 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220 (select (arr!30049 _keys!1544) from!1932) lt!437906))))

(declare-fun get!15590 (ValueCell!11125 V!35933) V!35933)

(declare-fun dynLambda!1857 (Int (_ BitVec 64)) V!35933)

(assert (=> b!987673 (= lt!437906 (get!15590 (select (arr!30048 _values!1278) from!1932) (dynLambda!1857 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!987673 (= lt!437916 (+!3074 lt!437914 lt!437915))))

(assert (=> b!987673 (= lt!437915 (tuple2!14851 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220))))

(declare-fun getCurrentListMapNoExtraKeys!3480 (array!62387 array!62385 (_ BitVec 32) (_ BitVec 32) V!35933 V!35933 (_ BitVec 32) Int) ListLongMap!13547)

(assert (=> b!987673 (= lt!437914 (getCurrentListMapNoExtraKeys!3480 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281))))

(declare-fun b!987674 () Bool)

(declare-fun res!660723 () Bool)

(assert (=> b!987674 (=> (not res!660723) (not e!556927))))

(declare-datatypes ((List!20782 0))(
  ( (Nil!20779) (Cons!20778 (h!21940 (_ BitVec 64)) (t!29707 List!20782)) )
))
(declare-fun arrayNoDuplicates!0 (array!62387 (_ BitVec 32) List!20782) Bool)

(assert (=> b!987674 (= res!660723 (arrayNoDuplicates!0 _keys!1544 #b00000000000000000000000000000000 Nil!20779))))

(declare-fun b!987675 () Bool)

(assert (=> b!987675 (= e!556926 (and e!556930 mapRes!36854))))

(declare-fun condMapEmpty!36854 () Bool)

(declare-fun mapDefault!36854 () ValueCell!11125)

