; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!69890 () Bool)

(assert start!69890)

(declare-fun mapIsEmpty!22639 () Bool)

(declare-fun mapRes!22639 () Bool)

(assert (=> mapIsEmpty!22639 mapRes!22639))

(declare-fun b!812574 () Bool)

(declare-fun e!450104 () Bool)

(declare-fun tp_is_empty!14043 () Bool)

(assert (=> b!812574 (= e!450104 tp_is_empty!14043)))

(declare-fun b!812575 () Bool)

(declare-fun e!450105 () Bool)

(assert (=> b!812575 (= e!450105 tp_is_empty!14043)))

(declare-fun b!812576 () Bool)

(declare-fun res!555244 () Bool)

(declare-fun e!450108 () Bool)

(assert (=> b!812576 (=> (not res!555244) (not e!450108))))

(declare-datatypes ((array!44308 0))(
  ( (array!44309 (arr!21216 (Array (_ BitVec 32) (_ BitVec 64))) (size!21637 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!44308)

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(declare-datatypes ((V!23725 0))(
  ( (V!23726 (val!7069 Int)) )
))
(declare-datatypes ((ValueCell!6606 0))(
  ( (ValueCellFull!6606 (v!9496 V!23725)) (EmptyCell!6606) )
))
(declare-datatypes ((array!44310 0))(
  ( (array!44311 (arr!21217 (Array (_ BitVec 32) ValueCell!6606)) (size!21638 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!44310)

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(assert (=> b!812576 (= res!555244 (and (= (size!21638 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!21637 _keys!976) (size!21638 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun res!555245 () Bool)

(assert (=> start!69890 (=> (not res!555245) (not e!450108))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!69890 (= res!555245 (validMask!0 mask!1312))))

(assert (=> start!69890 e!450108))

(declare-fun array_inv!16997 (array!44308) Bool)

(assert (=> start!69890 (array_inv!16997 _keys!976)))

(assert (=> start!69890 true))

(declare-fun e!450107 () Bool)

(declare-fun array_inv!16998 (array!44310) Bool)

(assert (=> start!69890 (and (array_inv!16998 _values!788) e!450107)))

(declare-fun b!812577 () Bool)

(assert (=> b!812577 (= e!450108 false)))

(declare-fun lt!364161 () Bool)

(declare-datatypes ((List!15101 0))(
  ( (Nil!15098) (Cons!15097 (h!16226 (_ BitVec 64)) (t!21416 List!15101)) )
))
(declare-fun arrayNoDuplicates!0 (array!44308 (_ BitVec 32) List!15101) Bool)

(assert (=> b!812577 (= lt!364161 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15098))))

(declare-fun mapNonEmpty!22639 () Bool)

(declare-fun tp!43747 () Bool)

(assert (=> mapNonEmpty!22639 (= mapRes!22639 (and tp!43747 e!450104))))

(declare-fun mapRest!22639 () (Array (_ BitVec 32) ValueCell!6606))

(declare-fun mapValue!22639 () ValueCell!6606)

(declare-fun mapKey!22639 () (_ BitVec 32))

(assert (=> mapNonEmpty!22639 (= (arr!21217 _values!788) (store mapRest!22639 mapKey!22639 mapValue!22639))))

(declare-fun b!812578 () Bool)

(declare-fun res!555246 () Bool)

(assert (=> b!812578 (=> (not res!555246) (not e!450108))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!44308 (_ BitVec 32)) Bool)

(assert (=> b!812578 (= res!555246 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun b!812579 () Bool)

(assert (=> b!812579 (= e!450107 (and e!450105 mapRes!22639))))

(declare-fun condMapEmpty!22639 () Bool)

(declare-fun mapDefault!22639 () ValueCell!6606)

(assert (=> b!812579 (= condMapEmpty!22639 (= (arr!21217 _values!788) ((as const (Array (_ BitVec 32) ValueCell!6606)) mapDefault!22639)))))

(assert (= (and start!69890 res!555245) b!812576))

(assert (= (and b!812576 res!555244) b!812578))

(assert (= (and b!812578 res!555246) b!812577))

(assert (= (and b!812579 condMapEmpty!22639) mapIsEmpty!22639))

(assert (= (and b!812579 (not condMapEmpty!22639)) mapNonEmpty!22639))

(get-info :version)

(assert (= (and mapNonEmpty!22639 ((_ is ValueCellFull!6606) mapValue!22639)) b!812574))

(assert (= (and b!812579 ((_ is ValueCellFull!6606) mapDefault!22639)) b!812575))

(assert (= start!69890 b!812579))

(declare-fun m!754917 () Bool)

(assert (=> start!69890 m!754917))

(declare-fun m!754919 () Bool)

(assert (=> start!69890 m!754919))

(declare-fun m!754921 () Bool)

(assert (=> start!69890 m!754921))

(declare-fun m!754923 () Bool)

(assert (=> b!812577 m!754923))

(declare-fun m!754925 () Bool)

(assert (=> mapNonEmpty!22639 m!754925))

(declare-fun m!754927 () Bool)

(assert (=> b!812578 m!754927))

(check-sat (not start!69890) tp_is_empty!14043 (not mapNonEmpty!22639) (not b!812577) (not b!812578))
(check-sat)
