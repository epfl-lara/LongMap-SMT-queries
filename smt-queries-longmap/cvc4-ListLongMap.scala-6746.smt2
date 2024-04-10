; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!84558 () Bool)

(assert start!84558)

(declare-fun b_free!20039 () Bool)

(declare-fun b_next!20039 () Bool)

(assert (=> start!84558 (= b_free!20039 (not b_next!20039))))

(declare-fun tp!69905 () Bool)

(declare-fun b_and!32147 () Bool)

(assert (=> start!84558 (= tp!69905 b_and!32147)))

(declare-fun b!989012 () Bool)

(declare-fun e!557680 () Bool)

(declare-fun from!1932 () (_ BitVec 32))

(declare-datatypes ((V!35989 0))(
  ( (V!35990 (val!11678 Int)) )
))
(declare-datatypes ((ValueCell!11146 0))(
  ( (ValueCellFull!11146 (v!14245 V!35989)) (EmptyCell!11146) )
))
(declare-datatypes ((array!62469 0))(
  ( (array!62470 (arr!30088 (Array (_ BitVec 32) ValueCell!11146)) (size!30567 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!62469)

(assert (=> b!989012 (= e!557680 (not (bvslt from!1932 (size!30567 _values!1278))))))

(declare-fun mask!1948 () (_ BitVec 32))

(declare-fun minValue!1220 () V!35989)

(declare-fun extraKeys!1199 () (_ BitVec 32))

(declare-datatypes ((tuple2!14882 0))(
  ( (tuple2!14883 (_1!7452 (_ BitVec 64)) (_2!7452 V!35989)) )
))
(declare-datatypes ((List!20812 0))(
  ( (Nil!20809) (Cons!20808 (h!21970 tuple2!14882) (t!29763 List!20812)) )
))
(declare-datatypes ((ListLongMap!13579 0))(
  ( (ListLongMap!13580 (toList!6805 List!20812)) )
))
(declare-fun lt!438680 () ListLongMap!13579)

(declare-fun zeroValue!1220 () V!35989)

(declare-fun defaultEntry!1281 () Int)

(declare-datatypes ((array!62471 0))(
  ( (array!62472 (arr!30089 (Array (_ BitVec 32) (_ BitVec 64))) (size!30568 (_ BitVec 32))) )
))
(declare-fun _keys!1544 () array!62471)

(declare-fun getCurrentListMap!3864 (array!62471 array!62469 (_ BitVec 32) (_ BitVec 32) V!35989 V!35989 (_ BitVec 32) Int) ListLongMap!13579)

(assert (=> b!989012 (= lt!438680 (getCurrentListMap!3864 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281))))

(declare-fun lt!438684 () ListLongMap!13579)

(declare-fun lt!438681 () tuple2!14882)

(declare-fun lt!438682 () tuple2!14882)

(declare-fun +!3083 (ListLongMap!13579 tuple2!14882) ListLongMap!13579)

(assert (=> b!989012 (= (+!3083 (+!3083 lt!438684 lt!438681) lt!438682) (+!3083 (+!3083 lt!438684 lt!438682) lt!438681))))

(declare-fun lt!438685 () V!35989)

(assert (=> b!989012 (= lt!438682 (tuple2!14883 (select (arr!30089 _keys!1544) from!1932) lt!438685))))

(assert (=> b!989012 (= lt!438681 (tuple2!14883 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220))))

(declare-datatypes ((Unit!32821 0))(
  ( (Unit!32822) )
))
(declare-fun lt!438683 () Unit!32821)

(declare-fun addCommutativeForDiffKeys!706 (ListLongMap!13579 (_ BitVec 64) V!35989 (_ BitVec 64) V!35989) Unit!32821)

(assert (=> b!989012 (= lt!438683 (addCommutativeForDiffKeys!706 lt!438684 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220 (select (arr!30089 _keys!1544) from!1932) lt!438685))))

(declare-fun b!989013 () Bool)

(declare-fun res!661475 () Bool)

(declare-fun e!557676 () Bool)

(assert (=> b!989013 (=> (not res!661475) (not e!557676))))

(assert (=> b!989013 (= res!661475 (and (= (bvand extraKeys!1199 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (not (= (bvand extraKeys!1199 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!989014 () Bool)

(declare-fun e!557679 () Bool)

(declare-fun tp_is_empty!23255 () Bool)

(assert (=> b!989014 (= e!557679 tp_is_empty!23255)))

(declare-fun b!989015 () Bool)

(declare-fun res!661477 () Bool)

(assert (=> b!989015 (=> (not res!661477) (not e!557676))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!989015 (= res!661477 (validKeyInArray!0 (select (arr!30089 _keys!1544) from!1932)))))

(declare-fun b!989016 () Bool)

(declare-fun res!661478 () Bool)

(assert (=> b!989016 (=> (not res!661478) (not e!557676))))

(assert (=> b!989016 (= res!661478 (and (= (size!30567 _values!1278) (bvadd #b00000000000000000000000000000001 mask!1948)) (= (size!30568 _keys!1544) (size!30567 _values!1278)) (bvsge mask!1948 #b00000000000000000000000000000000) (bvsge extraKeys!1199 #b00000000000000000000000000000000) (bvsle extraKeys!1199 #b00000000000000000000000000000011)))))

(declare-fun b!989017 () Bool)

(declare-fun res!661479 () Bool)

(assert (=> b!989017 (=> (not res!661479) (not e!557676))))

(declare-datatypes ((List!20813 0))(
  ( (Nil!20810) (Cons!20809 (h!21971 (_ BitVec 64)) (t!29764 List!20813)) )
))
(declare-fun arrayNoDuplicates!0 (array!62471 (_ BitVec 32) List!20813) Bool)

(assert (=> b!989017 (= res!661479 (arrayNoDuplicates!0 _keys!1544 #b00000000000000000000000000000000 Nil!20810))))

(declare-fun b!989018 () Bool)

(assert (=> b!989018 (= e!557676 e!557680)))

(declare-fun res!661476 () Bool)

(assert (=> b!989018 (=> (not res!661476) (not e!557680))))

(assert (=> b!989018 (= res!661476 (not (= #b0000000000000000000000000000000000000000000000000000000000000000 (select (arr!30089 _keys!1544) from!1932))))))

(declare-fun get!15616 (ValueCell!11146 V!35989) V!35989)

(declare-fun dynLambda!1866 (Int (_ BitVec 64)) V!35989)

(assert (=> b!989018 (= lt!438685 (get!15616 (select (arr!30088 _values!1278) from!1932) (dynLambda!1866 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun getCurrentListMapNoExtraKeys!3496 (array!62471 array!62469 (_ BitVec 32) (_ BitVec 32) V!35989 V!35989 (_ BitVec 32) Int) ListLongMap!13579)

(assert (=> b!989018 (= lt!438684 (getCurrentListMapNoExtraKeys!3496 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281))))

(declare-fun mapIsEmpty!36924 () Bool)

(declare-fun mapRes!36924 () Bool)

(assert (=> mapIsEmpty!36924 mapRes!36924))

(declare-fun b!989019 () Bool)

(declare-fun e!557677 () Bool)

(declare-fun e!557675 () Bool)

(assert (=> b!989019 (= e!557677 (and e!557675 mapRes!36924))))

(declare-fun condMapEmpty!36924 () Bool)

(declare-fun mapDefault!36924 () ValueCell!11146)

