; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!84352 () Bool)

(assert start!84352)

(declare-fun b_free!19957 () Bool)

(declare-fun b_next!19957 () Bool)

(assert (=> start!84352 (= b_free!19957 (not b_next!19957))))

(declare-fun tp!69646 () Bool)

(declare-fun b_and!31965 () Bool)

(assert (=> start!84352 (= tp!69646 b_and!31965)))

(declare-fun mapNonEmpty!36788 () Bool)

(declare-fun mapRes!36788 () Bool)

(declare-fun tp!69647 () Bool)

(declare-fun e!556361 () Bool)

(assert (=> mapNonEmpty!36788 (= mapRes!36788 (and tp!69647 e!556361))))

(declare-datatypes ((V!35881 0))(
  ( (V!35882 (val!11637 Int)) )
))
(declare-datatypes ((ValueCell!11105 0))(
  ( (ValueCellFull!11105 (v!14198 V!35881)) (EmptyCell!11105) )
))
(declare-datatypes ((array!62234 0))(
  ( (array!62235 (arr!29975 (Array (_ BitVec 32) ValueCell!11105)) (size!30456 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!62234)

(declare-fun mapRest!36788 () (Array (_ BitVec 32) ValueCell!11105))

(declare-fun mapValue!36788 () ValueCell!11105)

(declare-fun mapKey!36788 () (_ BitVec 32))

(assert (=> mapNonEmpty!36788 (= (arr!29975 _values!1278) (store mapRest!36788 mapKey!36788 mapValue!36788))))

(declare-fun b!986626 () Bool)

(declare-fun res!660114 () Bool)

(declare-fun e!556363 () Bool)

(assert (=> b!986626 (=> (not res!660114) (not e!556363))))

(declare-fun mask!1948 () (_ BitVec 32))

(declare-datatypes ((array!62236 0))(
  ( (array!62237 (arr!29976 (Array (_ BitVec 32) (_ BitVec 64))) (size!30457 (_ BitVec 32))) )
))
(declare-fun _keys!1544 () array!62236)

(declare-fun extraKeys!1199 () (_ BitVec 32))

(assert (=> b!986626 (= res!660114 (and (= (size!30456 _values!1278) (bvadd #b00000000000000000000000000000001 mask!1948)) (= (size!30457 _keys!1544) (size!30456 _values!1278)) (bvsge mask!1948 #b00000000000000000000000000000000) (bvsge extraKeys!1199 #b00000000000000000000000000000000) (bvsle extraKeys!1199 #b00000000000000000000000000000011)))))

(declare-fun b!986627 () Bool)

(declare-fun res!660117 () Bool)

(assert (=> b!986627 (=> (not res!660117) (not e!556363))))

(assert (=> b!986627 (= res!660117 (and (not (= (bvand extraKeys!1199 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1199 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!986629 () Bool)

(declare-fun e!556360 () Bool)

(declare-fun tp_is_empty!23173 () Bool)

(assert (=> b!986629 (= e!556360 tp_is_empty!23173)))

(declare-fun b!986630 () Bool)

(declare-fun res!660112 () Bool)

(assert (=> b!986630 (=> (not res!660112) (not e!556363))))

(declare-fun from!1932 () (_ BitVec 32))

(assert (=> b!986630 (= res!660112 (and (bvsge from!1932 #b00000000000000000000000000000000) (bvslt from!1932 (size!30457 _keys!1544))))))

(declare-fun b!986631 () Bool)

(assert (=> b!986631 (= e!556363 false)))

(declare-fun minValue!1220 () V!35881)

(declare-fun zeroValue!1220 () V!35881)

(declare-fun defaultEntry!1281 () Int)

(declare-datatypes ((tuple2!14902 0))(
  ( (tuple2!14903 (_1!7462 (_ BitVec 64)) (_2!7462 V!35881)) )
))
(declare-datatypes ((List!20789 0))(
  ( (Nil!20786) (Cons!20785 (h!21947 tuple2!14902) (t!29679 List!20789)) )
))
(declare-datatypes ((ListLongMap!13589 0))(
  ( (ListLongMap!13590 (toList!6810 List!20789)) )
))
(declare-fun lt!437319 () ListLongMap!13589)

(declare-fun +!3086 (ListLongMap!13589 tuple2!14902) ListLongMap!13589)

(declare-fun getCurrentListMapNoExtraKeys!3514 (array!62236 array!62234 (_ BitVec 32) (_ BitVec 32) V!35881 V!35881 (_ BitVec 32) Int) ListLongMap!13589)

(assert (=> b!986631 (= lt!437319 (+!3086 (getCurrentListMapNoExtraKeys!3514 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281) (tuple2!14903 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220)))))

(declare-fun b!986632 () Bool)

(declare-fun e!556364 () Bool)

(assert (=> b!986632 (= e!556364 (and e!556360 mapRes!36788))))

(declare-fun condMapEmpty!36788 () Bool)

(declare-fun mapDefault!36788 () ValueCell!11105)

(assert (=> b!986632 (= condMapEmpty!36788 (= (arr!29975 _values!1278) ((as const (Array (_ BitVec 32) ValueCell!11105)) mapDefault!36788)))))

(declare-fun mapIsEmpty!36788 () Bool)

(assert (=> mapIsEmpty!36788 mapRes!36788))

(declare-fun b!986633 () Bool)

(declare-fun res!660116 () Bool)

(assert (=> b!986633 (=> (not res!660116) (not e!556363))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!62236 (_ BitVec 32)) Bool)

(assert (=> b!986633 (= res!660116 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1544 mask!1948))))

(declare-fun b!986634 () Bool)

(assert (=> b!986634 (= e!556361 tp_is_empty!23173)))

(declare-fun b!986635 () Bool)

(declare-fun res!660115 () Bool)

(assert (=> b!986635 (=> (not res!660115) (not e!556363))))

(declare-datatypes ((List!20790 0))(
  ( (Nil!20787) (Cons!20786 (h!21948 (_ BitVec 64)) (t!29680 List!20790)) )
))
(declare-fun arrayNoDuplicates!0 (array!62236 (_ BitVec 32) List!20790) Bool)

(assert (=> b!986635 (= res!660115 (arrayNoDuplicates!0 _keys!1544 #b00000000000000000000000000000000 Nil!20787))))

(declare-fun b!986628 () Bool)

(declare-fun res!660113 () Bool)

(assert (=> b!986628 (=> (not res!660113) (not e!556363))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!986628 (= res!660113 (validKeyInArray!0 (select (arr!29976 _keys!1544) from!1932)))))

(declare-fun res!660111 () Bool)

(assert (=> start!84352 (=> (not res!660111) (not e!556363))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!84352 (= res!660111 (validMask!0 mask!1948))))

(assert (=> start!84352 e!556363))

(assert (=> start!84352 true))

(assert (=> start!84352 tp_is_empty!23173))

(declare-fun array_inv!23175 (array!62234) Bool)

(assert (=> start!84352 (and (array_inv!23175 _values!1278) e!556364)))

(assert (=> start!84352 tp!69646))

(declare-fun array_inv!23176 (array!62236) Bool)

(assert (=> start!84352 (array_inv!23176 _keys!1544)))

(assert (= (and start!84352 res!660111) b!986626))

(assert (= (and b!986626 res!660114) b!986633))

(assert (= (and b!986633 res!660116) b!986635))

(assert (= (and b!986635 res!660115) b!986630))

(assert (= (and b!986630 res!660112) b!986628))

(assert (= (and b!986628 res!660113) b!986627))

(assert (= (and b!986627 res!660117) b!986631))

(assert (= (and b!986632 condMapEmpty!36788) mapIsEmpty!36788))

(assert (= (and b!986632 (not condMapEmpty!36788)) mapNonEmpty!36788))

(get-info :version)

(assert (= (and mapNonEmpty!36788 ((_ is ValueCellFull!11105) mapValue!36788)) b!986634))

(assert (= (and b!986632 ((_ is ValueCellFull!11105) mapDefault!36788)) b!986629))

(assert (= start!84352 b!986632))

(declare-fun m!912785 () Bool)

(assert (=> b!986628 m!912785))

(assert (=> b!986628 m!912785))

(declare-fun m!912787 () Bool)

(assert (=> b!986628 m!912787))

(declare-fun m!912789 () Bool)

(assert (=> start!84352 m!912789))

(declare-fun m!912791 () Bool)

(assert (=> start!84352 m!912791))

(declare-fun m!912793 () Bool)

(assert (=> start!84352 m!912793))

(declare-fun m!912795 () Bool)

(assert (=> b!986635 m!912795))

(declare-fun m!912797 () Bool)

(assert (=> mapNonEmpty!36788 m!912797))

(declare-fun m!912799 () Bool)

(assert (=> b!986631 m!912799))

(assert (=> b!986631 m!912799))

(declare-fun m!912801 () Bool)

(assert (=> b!986631 m!912801))

(declare-fun m!912803 () Bool)

(assert (=> b!986633 m!912803))

(check-sat b_and!31965 (not start!84352) (not b!986631) tp_is_empty!23173 (not b!986635) (not mapNonEmpty!36788) (not b_next!19957) (not b!986628) (not b!986633))
(check-sat b_and!31965 (not b_next!19957))
