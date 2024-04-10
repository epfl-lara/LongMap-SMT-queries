; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!72606 () Bool)

(assert start!72606)

(declare-fun mapIsEmpty!25085 () Bool)

(declare-fun mapRes!25085 () Bool)

(assert (=> mapIsEmpty!25085 mapRes!25085))

(declare-fun b!842828 () Bool)

(declare-fun e!470166 () Bool)

(declare-fun tp_is_empty!15657 () Bool)

(assert (=> b!842828 (= e!470166 tp_is_empty!15657)))

(declare-fun mapNonEmpty!25085 () Bool)

(declare-fun tp!48403 () Bool)

(assert (=> mapNonEmpty!25085 (= mapRes!25085 (and tp!48403 e!470166))))

(declare-datatypes ((V!25923 0))(
  ( (V!25924 (val!7876 Int)) )
))
(declare-datatypes ((ValueCell!7389 0))(
  ( (ValueCellFull!7389 (v!10301 V!25923)) (EmptyCell!7389) )
))
(declare-fun mapRest!25085 () (Array (_ BitVec 32) ValueCell!7389))

(declare-fun mapValue!25085 () ValueCell!7389)

(declare-fun mapKey!25085 () (_ BitVec 32))

(declare-datatypes ((array!47580 0))(
  ( (array!47581 (arr!22821 (Array (_ BitVec 32) ValueCell!7389)) (size!23261 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!47580)

(assert (=> mapNonEmpty!25085 (= (arr!22821 _values!688) (store mapRest!25085 mapKey!25085 mapValue!25085))))

(declare-fun b!842829 () Bool)

(declare-fun e!470167 () Bool)

(assert (=> b!842829 (= e!470167 false)))

(declare-fun lt!381052 () Bool)

(declare-datatypes ((array!47582 0))(
  ( (array!47583 (arr!22822 (Array (_ BitVec 32) (_ BitVec 64))) (size!23262 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!47582)

(declare-datatypes ((List!16222 0))(
  ( (Nil!16219) (Cons!16218 (h!17349 (_ BitVec 64)) (t!22593 List!16222)) )
))
(declare-fun arrayNoDuplicates!0 (array!47582 (_ BitVec 32) List!16222) Bool)

(assert (=> b!842829 (= lt!381052 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16219))))

(declare-fun b!842830 () Bool)

(declare-fun res!572810 () Bool)

(assert (=> b!842830 (=> (not res!572810) (not e!470167))))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!842830 (= res!572810 (validMask!0 mask!1196))))

(declare-fun b!842831 () Bool)

(declare-fun e!470165 () Bool)

(declare-fun e!470163 () Bool)

(assert (=> b!842831 (= e!470165 (and e!470163 mapRes!25085))))

(declare-fun condMapEmpty!25085 () Bool)

(declare-fun mapDefault!25085 () ValueCell!7389)

(assert (=> b!842831 (= condMapEmpty!25085 (= (arr!22821 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7389)) mapDefault!25085)))))

(declare-fun b!842832 () Bool)

(declare-fun res!572811 () Bool)

(assert (=> b!842832 (=> (not res!572811) (not e!470167))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!47582 (_ BitVec 32)) Bool)

(assert (=> b!842832 (= res!572811 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun res!572813 () Bool)

(assert (=> start!72606 (=> (not res!572813) (not e!470167))))

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> start!72606 (= res!572813 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23262 _keys!868))))))

(assert (=> start!72606 e!470167))

(assert (=> start!72606 true))

(declare-fun array_inv!18156 (array!47582) Bool)

(assert (=> start!72606 (array_inv!18156 _keys!868)))

(declare-fun array_inv!18157 (array!47580) Bool)

(assert (=> start!72606 (and (array_inv!18157 _values!688) e!470165)))

(declare-fun b!842833 () Bool)

(assert (=> b!842833 (= e!470163 tp_is_empty!15657)))

(declare-fun b!842834 () Bool)

(declare-fun res!572812 () Bool)

(assert (=> b!842834 (=> (not res!572812) (not e!470167))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(assert (=> b!842834 (= res!572812 (and (= (size!23261 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23262 _keys!868) (size!23261 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(assert (= (and start!72606 res!572813) b!842830))

(assert (= (and b!842830 res!572810) b!842834))

(assert (= (and b!842834 res!572812) b!842832))

(assert (= (and b!842832 res!572811) b!842829))

(assert (= (and b!842831 condMapEmpty!25085) mapIsEmpty!25085))

(assert (= (and b!842831 (not condMapEmpty!25085)) mapNonEmpty!25085))

(get-info :version)

(assert (= (and mapNonEmpty!25085 ((_ is ValueCellFull!7389) mapValue!25085)) b!842828))

(assert (= (and b!842831 ((_ is ValueCellFull!7389) mapDefault!25085)) b!842833))

(assert (= start!72606 b!842831))

(declare-fun m!785769 () Bool)

(assert (=> b!842829 m!785769))

(declare-fun m!785771 () Bool)

(assert (=> mapNonEmpty!25085 m!785771))

(declare-fun m!785773 () Bool)

(assert (=> b!842830 m!785773))

(declare-fun m!785775 () Bool)

(assert (=> start!72606 m!785775))

(declare-fun m!785777 () Bool)

(assert (=> start!72606 m!785777))

(declare-fun m!785779 () Bool)

(assert (=> b!842832 m!785779))

(check-sat (not mapNonEmpty!25085) (not start!72606) tp_is_empty!15657 (not b!842830) (not b!842832) (not b!842829))
(check-sat)
