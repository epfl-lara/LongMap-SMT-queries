; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!84358 () Bool)

(assert start!84358)

(declare-fun b!986728 () Bool)

(declare-fun res!660140 () Bool)

(declare-fun e!556420 () Bool)

(assert (=> b!986728 (=> (not res!660140) (not e!556420))))

(declare-fun mask!1948 () (_ BitVec 32))

(declare-fun extraKeys!1199 () (_ BitVec 32))

(declare-datatypes ((array!62283 0))(
  ( (array!62284 (arr!29999 (Array (_ BitVec 32) (_ BitVec 64))) (size!30478 (_ BitVec 32))) )
))
(declare-fun _keys!1544 () array!62283)

(declare-datatypes ((V!35865 0))(
  ( (V!35866 (val!11631 Int)) )
))
(declare-datatypes ((ValueCell!11099 0))(
  ( (ValueCellFull!11099 (v!14193 V!35865)) (EmptyCell!11099) )
))
(declare-datatypes ((array!62285 0))(
  ( (array!62286 (arr!30000 (Array (_ BitVec 32) ValueCell!11099)) (size!30479 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!62285)

(assert (=> b!986728 (= res!660140 (and (= (size!30479 _values!1278) (bvadd #b00000000000000000000000000000001 mask!1948)) (= (size!30478 _keys!1544) (size!30479 _values!1278)) (bvsge mask!1948 #b00000000000000000000000000000000) (bvsge extraKeys!1199 #b00000000000000000000000000000000) (bvsle extraKeys!1199 #b00000000000000000000000000000011)))))

(declare-fun b!986729 () Bool)

(declare-fun res!660139 () Bool)

(assert (=> b!986729 (=> (not res!660139) (not e!556420))))

(declare-datatypes ((List!20751 0))(
  ( (Nil!20748) (Cons!20747 (h!21909 (_ BitVec 64)) (t!29650 List!20751)) )
))
(declare-fun arrayNoDuplicates!0 (array!62283 (_ BitVec 32) List!20751) Bool)

(assert (=> b!986729 (= res!660139 (arrayNoDuplicates!0 _keys!1544 #b00000000000000000000000000000000 Nil!20748))))

(declare-fun b!986730 () Bool)

(declare-fun from!1932 () (_ BitVec 32))

(declare-fun lt!437537 () Bool)

(assert (=> b!986730 (= e!556420 (and (or lt!437537 (= (bvand extraKeys!1199 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (or lt!437537 (not (= (bvand extraKeys!1199 #b00000000000000000000000000000010) #b00000000000000000000000000000000))) (or (= (bvand extraKeys!1199 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (not lt!437537)) (bvslt (bvadd #b00000000000000000000000000000001 from!1932) #b00000000000000000000000000000000)))))

(assert (=> b!986730 (= lt!437537 (= (bvand extraKeys!1199 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun b!986731 () Bool)

(declare-fun res!660138 () Bool)

(assert (=> b!986731 (=> (not res!660138) (not e!556420))))

(assert (=> b!986731 (= res!660138 (and (bvsge from!1932 #b00000000000000000000000000000000) (bvslt from!1932 (size!30478 _keys!1544))))))

(declare-fun b!986732 () Bool)

(declare-fun res!660143 () Bool)

(assert (=> b!986732 (=> (not res!660143) (not e!556420))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!62283 (_ BitVec 32)) Bool)

(assert (=> b!986732 (= res!660143 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1544 mask!1948))))

(declare-fun mapIsEmpty!36770 () Bool)

(declare-fun mapRes!36770 () Bool)

(assert (=> mapIsEmpty!36770 mapRes!36770))

(declare-fun mapNonEmpty!36770 () Bool)

(declare-fun tp!69625 () Bool)

(declare-fun e!556422 () Bool)

(assert (=> mapNonEmpty!36770 (= mapRes!36770 (and tp!69625 e!556422))))

(declare-fun mapRest!36770 () (Array (_ BitVec 32) ValueCell!11099))

(declare-fun mapKey!36770 () (_ BitVec 32))

(declare-fun mapValue!36770 () ValueCell!11099)

(assert (=> mapNonEmpty!36770 (= (arr!30000 _values!1278) (store mapRest!36770 mapKey!36770 mapValue!36770))))

(declare-fun res!660142 () Bool)

(assert (=> start!84358 (=> (not res!660142) (not e!556420))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!84358 (= res!660142 (validMask!0 mask!1948))))

(assert (=> start!84358 e!556420))

(assert (=> start!84358 true))

(declare-fun e!556418 () Bool)

(declare-fun array_inv!23183 (array!62285) Bool)

(assert (=> start!84358 (and (array_inv!23183 _values!1278) e!556418)))

(declare-fun array_inv!23184 (array!62283) Bool)

(assert (=> start!84358 (array_inv!23184 _keys!1544)))

(declare-fun b!986733 () Bool)

(declare-fun res!660141 () Bool)

(assert (=> b!986733 (=> (not res!660141) (not e!556420))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!986733 (= res!660141 (validKeyInArray!0 (select (arr!29999 _keys!1544) from!1932)))))

(declare-fun b!986734 () Bool)

(declare-fun tp_is_empty!23161 () Bool)

(assert (=> b!986734 (= e!556422 tp_is_empty!23161)))

(declare-fun b!986735 () Bool)

(declare-fun e!556419 () Bool)

(assert (=> b!986735 (= e!556419 tp_is_empty!23161)))

(declare-fun b!986736 () Bool)

(assert (=> b!986736 (= e!556418 (and e!556419 mapRes!36770))))

(declare-fun condMapEmpty!36770 () Bool)

(declare-fun mapDefault!36770 () ValueCell!11099)

