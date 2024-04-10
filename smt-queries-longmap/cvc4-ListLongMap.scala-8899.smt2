; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!108038 () Bool)

(assert start!108038)

(declare-fun mapIsEmpty!51494 () Bool)

(declare-fun mapRes!51494 () Bool)

(assert (=> mapIsEmpty!51494 mapRes!51494))

(declare-fun b!1276036 () Bool)

(declare-fun res!848064 () Bool)

(declare-fun e!728587 () Bool)

(assert (=> b!1276036 (=> (not res!848064) (not e!728587))))

(declare-fun mask!1805 () (_ BitVec 32))

(declare-fun extraKeys!1108 () (_ BitVec 32))

(declare-datatypes ((array!83716 0))(
  ( (array!83717 (arr!40370 (Array (_ BitVec 32) (_ BitVec 64))) (size!40920 (_ BitVec 32))) )
))
(declare-fun _keys!1427 () array!83716)

(declare-datatypes ((V!49517 0))(
  ( (V!49518 (val!16730 Int)) )
))
(declare-datatypes ((ValueCell!15757 0))(
  ( (ValueCellFull!15757 (v!19327 V!49517)) (EmptyCell!15757) )
))
(declare-datatypes ((array!83718 0))(
  ( (array!83719 (arr!40371 (Array (_ BitVec 32) ValueCell!15757)) (size!40921 (_ BitVec 32))) )
))
(declare-fun _values!1187 () array!83718)

(assert (=> b!1276036 (= res!848064 (and (= (size!40921 _values!1187) (bvadd #b00000000000000000000000000000001 mask!1805)) (= (size!40920 _keys!1427) (size!40921 _values!1187)) (bvsge mask!1805 #b00000000000000000000000000000000) (bvsge extraKeys!1108 #b00000000000000000000000000000000) (bvsle extraKeys!1108 #b00000000000000000000000000000011)))))

(declare-fun res!848062 () Bool)

(assert (=> start!108038 (=> (not res!848062) (not e!728587))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!108038 (= res!848062 (validMask!0 mask!1805))))

(assert (=> start!108038 e!728587))

(assert (=> start!108038 true))

(declare-fun e!728589 () Bool)

(declare-fun array_inv!30683 (array!83718) Bool)

(assert (=> start!108038 (and (array_inv!30683 _values!1187) e!728589)))

(declare-fun array_inv!30684 (array!83716) Bool)

(assert (=> start!108038 (array_inv!30684 _keys!1427)))

(declare-fun b!1276037 () Bool)

(declare-fun e!728588 () Bool)

(declare-fun tp_is_empty!33311 () Bool)

(assert (=> b!1276037 (= e!728588 tp_is_empty!33311)))

(declare-fun b!1276038 () Bool)

(assert (=> b!1276038 (= e!728587 false)))

(declare-fun lt!575434 () Bool)

(declare-datatypes ((List!28633 0))(
  ( (Nil!28630) (Cons!28629 (h!29838 (_ BitVec 64)) (t!42169 List!28633)) )
))
(declare-fun arrayNoDuplicates!0 (array!83716 (_ BitVec 32) List!28633) Bool)

(assert (=> b!1276038 (= lt!575434 (arrayNoDuplicates!0 _keys!1427 #b00000000000000000000000000000000 Nil!28630))))

(declare-fun mapNonEmpty!51494 () Bool)

(declare-fun tp!98252 () Bool)

(declare-fun e!728585 () Bool)

(assert (=> mapNonEmpty!51494 (= mapRes!51494 (and tp!98252 e!728585))))

(declare-fun mapValue!51494 () ValueCell!15757)

(declare-fun mapKey!51494 () (_ BitVec 32))

(declare-fun mapRest!51494 () (Array (_ BitVec 32) ValueCell!15757))

(assert (=> mapNonEmpty!51494 (= (arr!40371 _values!1187) (store mapRest!51494 mapKey!51494 mapValue!51494))))

(declare-fun b!1276039 () Bool)

(assert (=> b!1276039 (= e!728585 tp_is_empty!33311)))

(declare-fun b!1276040 () Bool)

(declare-fun res!848063 () Bool)

(assert (=> b!1276040 (=> (not res!848063) (not e!728587))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!83716 (_ BitVec 32)) Bool)

(assert (=> b!1276040 (= res!848063 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1427 mask!1805))))

(declare-fun b!1276041 () Bool)

(assert (=> b!1276041 (= e!728589 (and e!728588 mapRes!51494))))

(declare-fun condMapEmpty!51494 () Bool)

(declare-fun mapDefault!51494 () ValueCell!15757)

