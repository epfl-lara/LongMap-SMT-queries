; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!41016 () Bool)

(assert start!41016)

(declare-fun b_free!10951 () Bool)

(declare-fun b_next!10951 () Bool)

(assert (=> start!41016 (= b_free!10951 (not b_next!10951))))

(declare-fun tp!38680 () Bool)

(declare-fun b_and!19093 () Bool)

(assert (=> start!41016 (= tp!38680 b_and!19093)))

(declare-fun b!457098 () Bool)

(declare-fun res!272920 () Bool)

(declare-fun e!266993 () Bool)

(assert (=> b!457098 (=> (not res!272920) (not e!266993))))

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!457098 (= res!272920 (validMask!0 mask!1025))))

(declare-fun b!457099 () Bool)

(declare-fun res!272914 () Bool)

(assert (=> b!457099 (=> (not res!272914) (not e!266993))))

(declare-datatypes ((array!28379 0))(
  ( (array!28380 (arr!13633 (Array (_ BitVec 32) (_ BitVec 64))) (size!13985 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!28379)

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!457099 (= res!272914 (or (= (select (arr!13633 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!13633 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!457100 () Bool)

(declare-fun e!266990 () Bool)

(assert (=> b!457100 (= e!266993 e!266990)))

(declare-fun res!272917 () Bool)

(assert (=> b!457100 (=> (not res!272917) (not e!266990))))

(declare-fun lt!206757 () array!28379)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!28379 (_ BitVec 32)) Bool)

(assert (=> b!457100 (= res!272917 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!206757 mask!1025))))

(declare-fun k!794 () (_ BitVec 64))

(assert (=> b!457100 (= lt!206757 (array!28380 (store (arr!13633 _keys!709) i!563 k!794) (size!13985 _keys!709)))))

(declare-datatypes ((V!17491 0))(
  ( (V!17492 (val!6189 Int)) )
))
(declare-datatypes ((tuple2!8152 0))(
  ( (tuple2!8153 (_1!4087 (_ BitVec 64)) (_2!4087 V!17491)) )
))
(declare-datatypes ((List!8226 0))(
  ( (Nil!8223) (Cons!8222 (h!9078 tuple2!8152) (t!14056 List!8226)) )
))
(declare-datatypes ((ListLongMap!7065 0))(
  ( (ListLongMap!7066 (toList!3548 List!8226)) )
))
(declare-fun lt!206754 () ListLongMap!7065)

(declare-datatypes ((ValueCell!5801 0))(
  ( (ValueCellFull!5801 (v!8455 V!17491)) (EmptyCell!5801) )
))
(declare-datatypes ((array!28381 0))(
  ( (array!28382 (arr!13634 (Array (_ BitVec 32) ValueCell!5801)) (size!13986 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!28381)

(declare-fun lt!206759 () ListLongMap!7065)

(declare-fun b!457101 () Bool)

(declare-fun from!863 () (_ BitVec 32))

(declare-fun defaultEntry!557 () Int)

(declare-fun e!266988 () Bool)

(declare-fun +!1584 (ListLongMap!7065 tuple2!8152) ListLongMap!7065)

(declare-fun get!6707 (ValueCell!5801 V!17491) V!17491)

(declare-fun dynLambda!875 (Int (_ BitVec 64)) V!17491)

(assert (=> b!457101 (= e!266988 (= lt!206754 (+!1584 lt!206759 (tuple2!8153 (select (arr!13633 _keys!709) from!863) (get!6707 (select (arr!13634 _values!549) from!863) (dynLambda!875 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun b!457102 () Bool)

(declare-fun e!266989 () Bool)

(assert (=> b!457102 (= e!266989 (not e!266988))))

(declare-fun res!272911 () Bool)

(assert (=> b!457102 (=> res!272911 e!266988)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!457102 (= res!272911 (not (validKeyInArray!0 (select (arr!13633 _keys!709) from!863))))))

(declare-fun lt!206753 () ListLongMap!7065)

(assert (=> b!457102 (= lt!206753 lt!206759)))

(declare-fun v!412 () V!17491)

(declare-fun lt!206755 () ListLongMap!7065)

(assert (=> b!457102 (= lt!206759 (+!1584 lt!206755 (tuple2!8153 k!794 v!412)))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun zeroValue!515 () V!17491)

(declare-fun lt!206756 () array!28381)

(declare-fun minValue!515 () V!17491)

(declare-fun getCurrentListMapNoExtraKeys!1731 (array!28379 array!28381 (_ BitVec 32) (_ BitVec 32) V!17491 V!17491 (_ BitVec 32) Int) ListLongMap!7065)

(assert (=> b!457102 (= lt!206753 (getCurrentListMapNoExtraKeys!1731 lt!206757 lt!206756 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(assert (=> b!457102 (= lt!206755 (getCurrentListMapNoExtraKeys!1731 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-datatypes ((Unit!13290 0))(
  ( (Unit!13291) )
))
(declare-fun lt!206758 () Unit!13290)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!744 (array!28379 array!28381 (_ BitVec 32) (_ BitVec 32) V!17491 V!17491 (_ BitVec 32) (_ BitVec 64) V!17491 (_ BitVec 32) Int) Unit!13290)

(assert (=> b!457102 (= lt!206758 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!744 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun mapIsEmpty!20074 () Bool)

(declare-fun mapRes!20074 () Bool)

(assert (=> mapIsEmpty!20074 mapRes!20074))

(declare-fun b!457103 () Bool)

(declare-fun e!266991 () Bool)

(declare-fun tp_is_empty!12289 () Bool)

(assert (=> b!457103 (= e!266991 tp_is_empty!12289)))

(declare-fun b!457104 () Bool)

(declare-fun res!272916 () Bool)

(assert (=> b!457104 (=> (not res!272916) (not e!266993))))

(declare-datatypes ((List!8227 0))(
  ( (Nil!8224) (Cons!8223 (h!9079 (_ BitVec 64)) (t!14057 List!8227)) )
))
(declare-fun arrayNoDuplicates!0 (array!28379 (_ BitVec 32) List!8227) Bool)

(assert (=> b!457104 (= res!272916 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!8224))))

(declare-fun res!272910 () Bool)

(assert (=> start!41016 (=> (not res!272910) (not e!266993))))

(assert (=> start!41016 (= res!272910 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13985 _keys!709))))))

(assert (=> start!41016 e!266993))

(assert (=> start!41016 tp_is_empty!12289))

(assert (=> start!41016 tp!38680))

(assert (=> start!41016 true))

(declare-fun e!266994 () Bool)

(declare-fun array_inv!9870 (array!28381) Bool)

(assert (=> start!41016 (and (array_inv!9870 _values!549) e!266994)))

(declare-fun array_inv!9871 (array!28379) Bool)

(assert (=> start!41016 (array_inv!9871 _keys!709)))

(declare-fun b!457105 () Bool)

(declare-fun res!272908 () Bool)

(assert (=> b!457105 (=> (not res!272908) (not e!266990))))

(assert (=> b!457105 (= res!272908 (bvsle from!863 i!563))))

(declare-fun b!457106 () Bool)

(declare-fun res!272919 () Bool)

(assert (=> b!457106 (=> (not res!272919) (not e!266990))))

(assert (=> b!457106 (= res!272919 (arrayNoDuplicates!0 lt!206757 #b00000000000000000000000000000000 Nil!8224))))

(declare-fun b!457107 () Bool)

(declare-fun res!272915 () Bool)

(assert (=> b!457107 (=> (not res!272915) (not e!266993))))

(assert (=> b!457107 (= res!272915 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13985 _keys!709))))))

(declare-fun b!457108 () Bool)

(declare-fun res!272918 () Bool)

(assert (=> b!457108 (=> (not res!272918) (not e!266993))))

(assert (=> b!457108 (= res!272918 (and (= (size!13986 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13985 _keys!709) (size!13986 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!20074 () Bool)

(declare-fun tp!38679 () Bool)

(declare-fun e!266992 () Bool)

(assert (=> mapNonEmpty!20074 (= mapRes!20074 (and tp!38679 e!266992))))

(declare-fun mapValue!20074 () ValueCell!5801)

(declare-fun mapRest!20074 () (Array (_ BitVec 32) ValueCell!5801))

(declare-fun mapKey!20074 () (_ BitVec 32))

(assert (=> mapNonEmpty!20074 (= (arr!13634 _values!549) (store mapRest!20074 mapKey!20074 mapValue!20074))))

(declare-fun b!457109 () Bool)

(declare-fun res!272921 () Bool)

(assert (=> b!457109 (=> (not res!272921) (not e!266993))))

(assert (=> b!457109 (= res!272921 (validKeyInArray!0 k!794))))

(declare-fun b!457110 () Bool)

(assert (=> b!457110 (= e!266992 tp_is_empty!12289)))

(declare-fun b!457111 () Bool)

(assert (=> b!457111 (= e!266994 (and e!266991 mapRes!20074))))

(declare-fun condMapEmpty!20074 () Bool)

(declare-fun mapDefault!20074 () ValueCell!5801)

