; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!94052 () Bool)

(assert start!94052)

(declare-fun b_free!21289 () Bool)

(declare-fun b_next!21289 () Bool)

(assert (=> start!94052 (= b_free!21289 (not b_next!21289))))

(declare-fun tp!75290 () Bool)

(declare-fun b_and!34013 () Bool)

(assert (=> start!94052 (= tp!75290 b_and!34013)))

(declare-fun b!1062423 () Bool)

(declare-fun e!605058 () Bool)

(declare-fun tp_is_empty!25099 () Bool)

(assert (=> b!1062423 (= e!605058 tp_is_empty!25099)))

(declare-fun b!1062424 () Bool)

(declare-fun res!709150 () Bool)

(declare-fun e!605056 () Bool)

(assert (=> b!1062424 (=> (not res!709150) (not e!605056))))

(declare-datatypes ((array!67253 0))(
  ( (array!67254 (arr!32328 (Array (_ BitVec 32) (_ BitVec 64))) (size!32865 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!67253)

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!67253 (_ BitVec 32)) Bool)

(assert (=> b!1062424 (= res!709150 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun b!1062425 () Bool)

(declare-fun res!709148 () Bool)

(assert (=> b!1062425 (=> (not res!709148) (not e!605056))))

(declare-datatypes ((List!22497 0))(
  ( (Nil!22494) (Cons!22493 (h!23711 (_ BitVec 64)) (t!31798 List!22497)) )
))
(declare-fun arrayNoDuplicates!0 (array!67253 (_ BitVec 32) List!22497) Bool)

(assert (=> b!1062425 (= res!709148 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!22494))))

(declare-fun b!1062426 () Bool)

(declare-fun e!605054 () Bool)

(assert (=> b!1062426 (= e!605054 tp_is_empty!25099)))

(declare-fun res!709147 () Bool)

(assert (=> start!94052 (=> (not res!709147) (not e!605056))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!94052 (= res!709147 (validMask!0 mask!1515))))

(assert (=> start!94052 e!605056))

(assert (=> start!94052 true))

(assert (=> start!94052 tp_is_empty!25099))

(declare-datatypes ((V!38601 0))(
  ( (V!38602 (val!12600 Int)) )
))
(declare-datatypes ((ValueCell!11846 0))(
  ( (ValueCellFull!11846 (v!15206 V!38601)) (EmptyCell!11846) )
))
(declare-datatypes ((array!67255 0))(
  ( (array!67256 (arr!32329 (Array (_ BitVec 32) ValueCell!11846)) (size!32866 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!67255)

(declare-fun e!605057 () Bool)

(declare-fun array_inv!25064 (array!67255) Bool)

(assert (=> start!94052 (and (array_inv!25064 _values!955) e!605057)))

(assert (=> start!94052 tp!75290))

(declare-fun array_inv!25065 (array!67253) Bool)

(assert (=> start!94052 (array_inv!25065 _keys!1163)))

(declare-fun mapIsEmpty!39319 () Bool)

(declare-fun mapRes!39319 () Bool)

(assert (=> mapIsEmpty!39319 mapRes!39319))

(declare-fun b!1062427 () Bool)

(assert (=> b!1062427 (= e!605057 (and e!605054 mapRes!39319))))

(declare-fun condMapEmpty!39319 () Bool)

(declare-fun mapDefault!39319 () ValueCell!11846)

(assert (=> b!1062427 (= condMapEmpty!39319 (= (arr!32329 _values!955) ((as const (Array (_ BitVec 32) ValueCell!11846)) mapDefault!39319)))))

(declare-fun b!1062428 () Bool)

(declare-fun res!709149 () Bool)

(assert (=> b!1062428 (=> (not res!709149) (not e!605056))))

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(assert (=> b!1062428 (= res!709149 (and (= (size!32866 _values!955) (bvadd mask!1515 #b00000000000000000000000000000001)) (= (size!32865 _keys!1163) (size!32866 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun mapNonEmpty!39319 () Bool)

(declare-fun tp!75289 () Bool)

(assert (=> mapNonEmpty!39319 (= mapRes!39319 (and tp!75289 e!605058))))

(declare-fun mapKey!39319 () (_ BitVec 32))

(declare-fun mapRest!39319 () (Array (_ BitVec 32) ValueCell!11846))

(declare-fun mapValue!39319 () ValueCell!11846)

(assert (=> mapNonEmpty!39319 (= (arr!32329 _values!955) (store mapRest!39319 mapKey!39319 mapValue!39319))))

(declare-fun b!1062429 () Bool)

(assert (=> b!1062429 (= e!605056 false)))

(declare-datatypes ((tuple2!15912 0))(
  ( (tuple2!15913 (_1!7967 (_ BitVec 64)) (_2!7967 V!38601)) )
))
(declare-datatypes ((List!22498 0))(
  ( (Nil!22495) (Cons!22494 (h!23712 tuple2!15912) (t!31799 List!22498)) )
))
(declare-datatypes ((ListLongMap!13889 0))(
  ( (ListLongMap!13890 (toList!6960 List!22498)) )
))
(declare-fun lt!467981 () ListLongMap!13889)

(declare-fun minValue!907 () V!38601)

(declare-fun defaultEntry!963 () Int)

(declare-fun zeroValueAfter!47 () V!38601)

(declare-fun getCurrentListMapNoExtraKeys!3608 (array!67253 array!67255 (_ BitVec 32) (_ BitVec 32) V!38601 V!38601 (_ BitVec 32) Int) ListLongMap!13889)

(assert (=> b!1062429 (= lt!467981 (getCurrentListMapNoExtraKeys!3608 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun zeroValueBefore!47 () V!38601)

(declare-fun lt!467982 () ListLongMap!13889)

(assert (=> b!1062429 (= lt!467982 (getCurrentListMapNoExtraKeys!3608 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (= (and start!94052 res!709147) b!1062428))

(assert (= (and b!1062428 res!709149) b!1062424))

(assert (= (and b!1062424 res!709150) b!1062425))

(assert (= (and b!1062425 res!709148) b!1062429))

(assert (= (and b!1062427 condMapEmpty!39319) mapIsEmpty!39319))

(assert (= (and b!1062427 (not condMapEmpty!39319)) mapNonEmpty!39319))

(get-info :version)

(assert (= (and mapNonEmpty!39319 ((_ is ValueCellFull!11846) mapValue!39319)) b!1062423))

(assert (= (and b!1062427 ((_ is ValueCellFull!11846) mapDefault!39319)) b!1062426))

(assert (= start!94052 b!1062427))

(declare-fun m!981679 () Bool)

(assert (=> mapNonEmpty!39319 m!981679))

(declare-fun m!981681 () Bool)

(assert (=> start!94052 m!981681))

(declare-fun m!981683 () Bool)

(assert (=> start!94052 m!981683))

(declare-fun m!981685 () Bool)

(assert (=> start!94052 m!981685))

(declare-fun m!981687 () Bool)

(assert (=> b!1062425 m!981687))

(declare-fun m!981689 () Bool)

(assert (=> b!1062429 m!981689))

(declare-fun m!981691 () Bool)

(assert (=> b!1062429 m!981691))

(declare-fun m!981693 () Bool)

(assert (=> b!1062424 m!981693))

(check-sat (not start!94052) (not b!1062425) (not mapNonEmpty!39319) (not b!1062424) (not b_next!21289) tp_is_empty!25099 (not b!1062429) b_and!34013)
(check-sat b_and!34013 (not b_next!21289))
