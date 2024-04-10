; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!93638 () Bool)

(assert start!93638)

(declare-fun mapNonEmpty!39079 () Bool)

(declare-fun mapRes!39079 () Bool)

(declare-fun tp!74885 () Bool)

(declare-fun e!602956 () Bool)

(assert (=> mapNonEmpty!39079 (= mapRes!39079 (and tp!74885 e!602956))))

(declare-datatypes ((V!38393 0))(
  ( (V!38394 (val!12522 Int)) )
))
(declare-datatypes ((ValueCell!11768 0))(
  ( (ValueCellFull!11768 (v!15132 V!38393)) (EmptyCell!11768) )
))
(declare-datatypes ((array!66917 0))(
  ( (array!66918 (arr!32168 (Array (_ BitVec 32) ValueCell!11768)) (size!32704 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!66917)

(declare-fun mapKey!39079 () (_ BitVec 32))

(declare-fun mapRest!39079 () (Array (_ BitVec 32) ValueCell!11768))

(declare-fun mapValue!39079 () ValueCell!11768)

(assert (=> mapNonEmpty!39079 (= (arr!32168 _values!955) (store mapRest!39079 mapKey!39079 mapValue!39079))))

(declare-fun b!1059411 () Bool)

(declare-fun e!602957 () Bool)

(declare-fun tp_is_empty!24943 () Bool)

(assert (=> b!1059411 (= e!602957 tp_is_empty!24943)))

(declare-fun b!1059412 () Bool)

(assert (=> b!1059412 (= e!602956 tp_is_empty!24943)))

(declare-fun b!1059413 () Bool)

(declare-fun res!707709 () Bool)

(declare-fun e!602958 () Bool)

(assert (=> b!1059413 (=> (not res!707709) (not e!602958))))

(declare-datatypes ((array!66919 0))(
  ( (array!66920 (arr!32169 (Array (_ BitVec 32) (_ BitVec 64))) (size!32705 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!66919)

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!66919 (_ BitVec 32)) Bool)

(assert (=> b!1059413 (= res!707709 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun res!707708 () Bool)

(assert (=> start!93638 (=> (not res!707708) (not e!602958))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!93638 (= res!707708 (validMask!0 mask!1515))))

(assert (=> start!93638 e!602958))

(assert (=> start!93638 true))

(declare-fun e!602954 () Bool)

(declare-fun array_inv!24938 (array!66917) Bool)

(assert (=> start!93638 (and (array_inv!24938 _values!955) e!602954)))

(declare-fun array_inv!24939 (array!66919) Bool)

(assert (=> start!93638 (array_inv!24939 _keys!1163)))

(declare-fun b!1059414 () Bool)

(declare-fun res!707710 () Bool)

(assert (=> b!1059414 (=> (not res!707710) (not e!602958))))

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(assert (=> b!1059414 (= res!707710 (and (= (size!32704 _values!955) (bvadd #b00000000000000000000000000000001 mask!1515)) (= (size!32705 _keys!1163) (size!32704 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1059415 () Bool)

(assert (=> b!1059415 (= e!602958 false)))

(declare-fun lt!467119 () Bool)

(declare-datatypes ((List!22428 0))(
  ( (Nil!22425) (Cons!22424 (h!23633 (_ BitVec 64)) (t!31735 List!22428)) )
))
(declare-fun arrayNoDuplicates!0 (array!66919 (_ BitVec 32) List!22428) Bool)

(assert (=> b!1059415 (= lt!467119 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!22425))))

(declare-fun mapIsEmpty!39079 () Bool)

(assert (=> mapIsEmpty!39079 mapRes!39079))

(declare-fun b!1059416 () Bool)

(assert (=> b!1059416 (= e!602954 (and e!602957 mapRes!39079))))

(declare-fun condMapEmpty!39079 () Bool)

(declare-fun mapDefault!39079 () ValueCell!11768)

