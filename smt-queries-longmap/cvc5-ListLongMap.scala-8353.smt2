; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!101700 () Bool)

(assert start!101700)

(declare-fun b_free!26389 () Bool)

(declare-fun b_next!26389 () Bool)

(assert (=> start!101700 (= b_free!26389 (not b_next!26389))))

(declare-fun tp!92212 () Bool)

(declare-fun b_and!44039 () Bool)

(assert (=> start!101700 (= tp!92212 b_and!44039)))

(declare-fun b!1223442 () Bool)

(declare-fun res!812885 () Bool)

(declare-fun e!694842 () Bool)

(assert (=> b!1223442 (=> (not res!812885) (not e!694842))))

(declare-datatypes ((array!78969 0))(
  ( (array!78970 (arr!38111 (Array (_ BitVec 32) (_ BitVec 64))) (size!38647 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!78969)

(declare-datatypes ((List!26903 0))(
  ( (Nil!26900) (Cons!26899 (h!28108 (_ BitVec 64)) (t!40272 List!26903)) )
))
(declare-fun arrayNoDuplicates!0 (array!78969 (_ BitVec 32) List!26903) Bool)

(assert (=> b!1223442 (= res!812885 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26900))))

(declare-fun b!1223443 () Bool)

(declare-fun e!694847 () Bool)

(declare-fun tp_is_empty!31093 () Bool)

(assert (=> b!1223443 (= e!694847 tp_is_empty!31093)))

(declare-fun b!1223444 () Bool)

(declare-fun e!694838 () Bool)

(declare-fun e!694844 () Bool)

(assert (=> b!1223444 (= e!694838 e!694844)))

(declare-fun res!812898 () Bool)

(assert (=> b!1223444 (=> res!812898 e!694844)))

(declare-fun k!934 () (_ BitVec 64))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> b!1223444 (= res!812898 (not (= (select (arr!38111 _keys!1208) from!1455) k!934)))))

(declare-fun b!1223445 () Bool)

(declare-fun res!812893 () Bool)

(declare-fun e!694849 () Bool)

(assert (=> b!1223445 (=> (not res!812893) (not e!694849))))

(declare-fun lt!556846 () array!78969)

(assert (=> b!1223445 (= res!812893 (arrayNoDuplicates!0 lt!556846 #b00000000000000000000000000000000 Nil!26900))))

(declare-fun b!1223446 () Bool)

(assert (=> b!1223446 (= e!694842 e!694849)))

(declare-fun res!812895 () Bool)

(assert (=> b!1223446 (=> (not res!812895) (not e!694849))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!78969 (_ BitVec 32)) Bool)

(assert (=> b!1223446 (= res!812895 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!556846 mask!1564))))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1223446 (= lt!556846 (array!78970 (store (arr!38111 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!38647 _keys!1208)))))

(declare-fun b!1223447 () Bool)

(declare-fun res!812891 () Bool)

(assert (=> b!1223447 (=> (not res!812891) (not e!694842))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1223447 (= res!812891 (validKeyInArray!0 k!934))))

(declare-fun mapIsEmpty!48538 () Bool)

(declare-fun mapRes!48538 () Bool)

(assert (=> mapIsEmpty!48538 mapRes!48538))

(declare-fun b!1223448 () Bool)

(declare-fun e!694837 () Bool)

(assert (=> b!1223448 (= e!694837 tp_is_empty!31093)))

(declare-datatypes ((V!46585 0))(
  ( (V!46586 (val!15603 Int)) )
))
(declare-datatypes ((tuple2!20102 0))(
  ( (tuple2!20103 (_1!10062 (_ BitVec 64)) (_2!10062 V!46585)) )
))
(declare-fun lt!556847 () tuple2!20102)

(declare-fun b!1223449 () Bool)

(declare-fun e!694843 () Bool)

(declare-datatypes ((List!26904 0))(
  ( (Nil!26901) (Cons!26900 (h!28109 tuple2!20102) (t!40273 List!26904)) )
))
(declare-datatypes ((ListLongMap!18071 0))(
  ( (ListLongMap!18072 (toList!9051 List!26904)) )
))
(declare-fun lt!556856 () ListLongMap!18071)

(declare-fun lt!556850 () ListLongMap!18071)

(declare-fun +!4110 (ListLongMap!18071 tuple2!20102) ListLongMap!18071)

(assert (=> b!1223449 (= e!694843 (= lt!556850 (+!4110 lt!556856 lt!556847)))))

(declare-fun b!1223450 () Bool)

(declare-datatypes ((Unit!40529 0))(
  ( (Unit!40530) )
))
(declare-fun e!694840 () Unit!40529)

(declare-fun Unit!40531 () Unit!40529)

(assert (=> b!1223450 (= e!694840 Unit!40531)))

(declare-fun b!1223451 () Bool)

(declare-fun e!694848 () Bool)

(declare-fun e!694845 () Bool)

(assert (=> b!1223451 (= e!694848 e!694845)))

(declare-fun res!812897 () Bool)

(assert (=> b!1223451 (=> res!812897 e!694845)))

(assert (=> b!1223451 (= res!812897 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(declare-fun zeroValue!944 () V!46585)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun lt!556853 () ListLongMap!18071)

(declare-datatypes ((ValueCell!14837 0))(
  ( (ValueCellFull!14837 (v!18265 V!46585)) (EmptyCell!14837) )
))
(declare-datatypes ((array!78971 0))(
  ( (array!78972 (arr!38112 (Array (_ BitVec 32) ValueCell!14837)) (size!38648 (_ BitVec 32))) )
))
(declare-fun lt!556843 () array!78971)

(declare-fun minValue!944 () V!46585)

(declare-fun getCurrentListMapNoExtraKeys!5473 (array!78969 array!78971 (_ BitVec 32) (_ BitVec 32) V!46585 V!46585 (_ BitVec 32) Int) ListLongMap!18071)

(assert (=> b!1223451 (= lt!556853 (getCurrentListMapNoExtraKeys!5473 lt!556846 lt!556843 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!556854 () V!46585)

(declare-fun _values!996 () array!78971)

(assert (=> b!1223451 (= lt!556843 (array!78972 (store (arr!38112 _values!996) i!673 (ValueCellFull!14837 lt!556854)) (size!38648 _values!996)))))

(declare-fun dynLambda!3348 (Int (_ BitVec 64)) V!46585)

(assert (=> b!1223451 (= lt!556854 (dynLambda!3348 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1223451 (= lt!556850 (getCurrentListMapNoExtraKeys!5473 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1223452 () Bool)

(declare-fun e!694846 () Bool)

(assert (=> b!1223452 (= e!694846 (and e!694837 mapRes!48538))))

(declare-fun condMapEmpty!48538 () Bool)

(declare-fun mapDefault!48538 () ValueCell!14837)

