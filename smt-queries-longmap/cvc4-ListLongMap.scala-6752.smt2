; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!84664 () Bool)

(assert start!84664)

(declare-fun b_free!20075 () Bool)

(declare-fun b_next!20075 () Bool)

(assert (=> start!84664 (= b_free!20075 (not b_next!20075))))

(declare-fun tp!70020 () Bool)

(declare-fun b_and!32221 () Bool)

(assert (=> start!84664 (= tp!70020 b_and!32221)))

(declare-fun b!990165 () Bool)

(declare-fun e!558327 () Bool)

(declare-fun e!558326 () Bool)

(assert (=> b!990165 (= e!558327 e!558326)))

(declare-fun res!662119 () Bool)

(assert (=> b!990165 (=> (not res!662119) (not e!558326))))

(declare-datatypes ((array!62543 0))(
  ( (array!62544 (arr!30123 (Array (_ BitVec 32) (_ BitVec 64))) (size!30602 (_ BitVec 32))) )
))
(declare-fun _keys!1544 () array!62543)

(declare-fun from!1932 () (_ BitVec 32))

(assert (=> b!990165 (= res!662119 (not (= #b1000000000000000000000000000000000000000000000000000000000000000 (select (arr!30123 _keys!1544) from!1932))))))

(declare-datatypes ((V!36037 0))(
  ( (V!36038 (val!11696 Int)) )
))
(declare-datatypes ((ValueCell!11164 0))(
  ( (ValueCellFull!11164 (v!14266 V!36037)) (EmptyCell!11164) )
))
(declare-datatypes ((array!62545 0))(
  ( (array!62546 (arr!30124 (Array (_ BitVec 32) ValueCell!11164)) (size!30603 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!62545)

(declare-fun defaultEntry!1281 () Int)

(declare-fun lt!439256 () V!36037)

(declare-fun get!15637 (ValueCell!11164 V!36037) V!36037)

(declare-fun dynLambda!1872 (Int (_ BitVec 64)) V!36037)

(assert (=> b!990165 (= lt!439256 (get!15637 (select (arr!30124 _values!1278) from!1932) (dynLambda!1872 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun minValue!1220 () V!36037)

(declare-fun extraKeys!1199 () (_ BitVec 32))

(declare-fun zeroValue!1220 () V!36037)

(declare-datatypes ((tuple2!14914 0))(
  ( (tuple2!14915 (_1!7468 (_ BitVec 64)) (_2!7468 V!36037)) )
))
(declare-datatypes ((List!20843 0))(
  ( (Nil!20840) (Cons!20839 (h!22001 tuple2!14914) (t!29814 List!20843)) )
))
(declare-datatypes ((ListLongMap!13611 0))(
  ( (ListLongMap!13612 (toList!6821 List!20843)) )
))
(declare-fun lt!439255 () ListLongMap!13611)

(declare-fun mask!1948 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!3509 (array!62543 array!62545 (_ BitVec 32) (_ BitVec 32) V!36037 V!36037 (_ BitVec 32) Int) ListLongMap!13611)

(assert (=> b!990165 (= lt!439255 (getCurrentListMapNoExtraKeys!3509 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281))))

(declare-fun b!990166 () Bool)

(declare-fun res!662118 () Bool)

(assert (=> b!990166 (=> (not res!662118) (not e!558327))))

(declare-datatypes ((List!20844 0))(
  ( (Nil!20841) (Cons!20840 (h!22002 (_ BitVec 64)) (t!29815 List!20844)) )
))
(declare-fun arrayNoDuplicates!0 (array!62543 (_ BitVec 32) List!20844) Bool)

(assert (=> b!990166 (= res!662118 (arrayNoDuplicates!0 _keys!1544 #b00000000000000000000000000000000 Nil!20841))))

(declare-fun b!990167 () Bool)

(declare-fun e!558324 () Bool)

(declare-fun tp_is_empty!23291 () Bool)

(assert (=> b!990167 (= e!558324 tp_is_empty!23291)))

(declare-fun mapIsEmpty!36985 () Bool)

(declare-fun mapRes!36985 () Bool)

(assert (=> mapIsEmpty!36985 mapRes!36985))

(declare-fun mapNonEmpty!36985 () Bool)

(declare-fun tp!70019 () Bool)

(declare-fun e!558323 () Bool)

(assert (=> mapNonEmpty!36985 (= mapRes!36985 (and tp!70019 e!558323))))

(declare-fun mapValue!36985 () ValueCell!11164)

(declare-fun mapRest!36985 () (Array (_ BitVec 32) ValueCell!11164))

(declare-fun mapKey!36985 () (_ BitVec 32))

(assert (=> mapNonEmpty!36985 (= (arr!30124 _values!1278) (store mapRest!36985 mapKey!36985 mapValue!36985))))

(declare-fun b!990168 () Bool)

(declare-fun res!662116 () Bool)

(assert (=> b!990168 (=> (not res!662116) (not e!558327))))

(assert (=> b!990168 (= res!662116 (and (= (size!30603 _values!1278) (bvadd #b00000000000000000000000000000001 mask!1948)) (= (size!30602 _keys!1544) (size!30603 _values!1278)) (bvsge mask!1948 #b00000000000000000000000000000000) (bvsge extraKeys!1199 #b00000000000000000000000000000000) (bvsle extraKeys!1199 #b00000000000000000000000000000011)))))

(declare-fun b!990170 () Bool)

(assert (=> b!990170 (= e!558326 (not (bvslt from!1932 (size!30603 _values!1278))))))

(declare-fun lt!439258 () ListLongMap!13611)

(declare-fun getCurrentListMap!3871 (array!62543 array!62545 (_ BitVec 32) (_ BitVec 32) V!36037 V!36037 (_ BitVec 32) Int) ListLongMap!13611)

(assert (=> b!990170 (= lt!439258 (getCurrentListMap!3871 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281))))

(declare-fun lt!439257 () tuple2!14914)

(declare-fun lt!439260 () tuple2!14914)

(declare-fun +!3091 (ListLongMap!13611 tuple2!14914) ListLongMap!13611)

(assert (=> b!990170 (= (+!3091 (+!3091 lt!439255 lt!439257) lt!439260) (+!3091 (+!3091 lt!439255 lt!439260) lt!439257))))

(assert (=> b!990170 (= lt!439260 (tuple2!14915 (select (arr!30123 _keys!1544) from!1932) lt!439256))))

(assert (=> b!990170 (= lt!439257 (tuple2!14915 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220))))

(declare-datatypes ((Unit!32856 0))(
  ( (Unit!32857) )
))
(declare-fun lt!439259 () Unit!32856)

(declare-fun addCommutativeForDiffKeys!713 (ListLongMap!13611 (_ BitVec 64) V!36037 (_ BitVec 64) V!36037) Unit!32856)

(assert (=> b!990170 (= lt!439259 (addCommutativeForDiffKeys!713 lt!439255 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220 (select (arr!30123 _keys!1544) from!1932) lt!439256))))

(declare-fun b!990171 () Bool)

(assert (=> b!990171 (= e!558323 tp_is_empty!23291)))

(declare-fun b!990172 () Bool)

(declare-fun res!662114 () Bool)

(assert (=> b!990172 (=> (not res!662114) (not e!558327))))

(assert (=> b!990172 (= res!662114 (and (= (bvand extraKeys!1199 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (not (= (bvand extraKeys!1199 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!990173 () Bool)

(declare-fun res!662121 () Bool)

(assert (=> b!990173 (=> (not res!662121) (not e!558327))))

(assert (=> b!990173 (= res!662121 (and (bvsge from!1932 #b00000000000000000000000000000000) (bvslt from!1932 (size!30602 _keys!1544))))))

(declare-fun b!990169 () Bool)

(declare-fun res!662115 () Bool)

(assert (=> b!990169 (=> (not res!662115) (not e!558327))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!990169 (= res!662115 (validKeyInArray!0 (select (arr!30123 _keys!1544) from!1932)))))

(declare-fun res!662117 () Bool)

(assert (=> start!84664 (=> (not res!662117) (not e!558327))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!84664 (= res!662117 (validMask!0 mask!1948))))

(assert (=> start!84664 e!558327))

(assert (=> start!84664 true))

(assert (=> start!84664 tp_is_empty!23291))

(declare-fun e!558325 () Bool)

(declare-fun array_inv!23265 (array!62545) Bool)

(assert (=> start!84664 (and (array_inv!23265 _values!1278) e!558325)))

(assert (=> start!84664 tp!70020))

(declare-fun array_inv!23266 (array!62543) Bool)

(assert (=> start!84664 (array_inv!23266 _keys!1544)))

(declare-fun b!990174 () Bool)

(assert (=> b!990174 (= e!558325 (and e!558324 mapRes!36985))))

(declare-fun condMapEmpty!36985 () Bool)

(declare-fun mapDefault!36985 () ValueCell!11164)

