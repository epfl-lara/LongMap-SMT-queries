; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!38744 () Bool)

(assert start!38744)

(declare-fun mapNonEmpty!16887 () Bool)

(declare-fun mapRes!16887 () Bool)

(declare-fun tp!33006 () Bool)

(declare-fun e!243070 () Bool)

(assert (=> mapNonEmpty!16887 (= mapRes!16887 (and tp!33006 e!243070))))

(declare-datatypes ((V!14675 0))(
  ( (V!14676 (val!5133 Int)) )
))
(declare-datatypes ((ValueCell!4745 0))(
  ( (ValueCellFull!4745 (v!7381 V!14675)) (EmptyCell!4745) )
))
(declare-fun mapValue!16887 () ValueCell!4745)

(declare-fun mapRest!16887 () (Array (_ BitVec 32) ValueCell!4745))

(declare-datatypes ((array!24238 0))(
  ( (array!24239 (arr!11568 (Array (_ BitVec 32) ValueCell!4745)) (size!11920 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!24238)

(declare-fun mapKey!16887 () (_ BitVec 32))

(assert (=> mapNonEmpty!16887 (= (arr!11568 _values!549) (store mapRest!16887 mapKey!16887 mapValue!16887))))

(declare-fun b!403924 () Bool)

(declare-fun res!232879 () Bool)

(declare-fun e!243066 () Bool)

(assert (=> b!403924 (=> (not res!232879) (not e!243066))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!403924 (= res!232879 (validKeyInArray!0 k0!794))))

(declare-fun b!403925 () Bool)

(declare-fun e!243068 () Bool)

(declare-fun tp_is_empty!10177 () Bool)

(assert (=> b!403925 (= e!243068 tp_is_empty!10177)))

(declare-fun b!403926 () Bool)

(declare-fun res!232881 () Bool)

(assert (=> b!403926 (=> (not res!232881) (not e!243066))))

(declare-datatypes ((array!24240 0))(
  ( (array!24241 (arr!11569 (Array (_ BitVec 32) (_ BitVec 64))) (size!11921 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!24240)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!24240 (_ BitVec 32)) Bool)

(assert (=> b!403926 (= res!232881 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!403927 () Bool)

(declare-fun res!232875 () Bool)

(assert (=> b!403927 (=> (not res!232875) (not e!243066))))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!403927 (= res!232875 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!11921 _keys!709))))))

(declare-fun b!403928 () Bool)

(declare-fun res!232877 () Bool)

(assert (=> b!403928 (=> (not res!232877) (not e!243066))))

(assert (=> b!403928 (= res!232877 (or (= (select (arr!11569 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!11569 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!403929 () Bool)

(declare-fun res!232880 () Bool)

(assert (=> b!403929 (=> (not res!232880) (not e!243066))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(assert (=> b!403929 (= res!232880 (and (= (size!11920 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!11921 _keys!709) (size!11920 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!403930 () Bool)

(declare-fun e!243069 () Bool)

(assert (=> b!403930 (= e!243069 false)))

(declare-fun lt!188129 () Bool)

(declare-fun lt!188130 () array!24240)

(declare-datatypes ((List!6619 0))(
  ( (Nil!6616) (Cons!6615 (h!7471 (_ BitVec 64)) (t!11785 List!6619)) )
))
(declare-fun arrayNoDuplicates!0 (array!24240 (_ BitVec 32) List!6619) Bool)

(assert (=> b!403930 (= lt!188129 (arrayNoDuplicates!0 lt!188130 #b00000000000000000000000000000000 Nil!6616))))

(declare-fun b!403931 () Bool)

(assert (=> b!403931 (= e!243066 e!243069)))

(declare-fun res!232884 () Bool)

(assert (=> b!403931 (=> (not res!232884) (not e!243069))))

(assert (=> b!403931 (= res!232884 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!188130 mask!1025))))

(assert (=> b!403931 (= lt!188130 (array!24241 (store (arr!11569 _keys!709) i!563 k0!794) (size!11921 _keys!709)))))

(declare-fun b!403932 () Bool)

(declare-fun res!232876 () Bool)

(assert (=> b!403932 (=> (not res!232876) (not e!243066))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!403932 (= res!232876 (validMask!0 mask!1025))))

(declare-fun b!403933 () Bool)

(declare-fun res!232882 () Bool)

(assert (=> b!403933 (=> (not res!232882) (not e!243066))))

(declare-fun arrayContainsKey!0 (array!24240 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!403933 (= res!232882 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun res!232878 () Bool)

(assert (=> start!38744 (=> (not res!232878) (not e!243066))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> start!38744 (= res!232878 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!11921 _keys!709))))))

(assert (=> start!38744 e!243066))

(assert (=> start!38744 true))

(declare-fun e!243067 () Bool)

(declare-fun array_inv!8544 (array!24238) Bool)

(assert (=> start!38744 (and (array_inv!8544 _values!549) e!243067)))

(declare-fun array_inv!8545 (array!24240) Bool)

(assert (=> start!38744 (array_inv!8545 _keys!709)))

(declare-fun b!403934 () Bool)

(declare-fun res!232883 () Bool)

(assert (=> b!403934 (=> (not res!232883) (not e!243066))))

(assert (=> b!403934 (= res!232883 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!6616))))

(declare-fun b!403935 () Bool)

(assert (=> b!403935 (= e!243067 (and e!243068 mapRes!16887))))

(declare-fun condMapEmpty!16887 () Bool)

(declare-fun mapDefault!16887 () ValueCell!4745)

(assert (=> b!403935 (= condMapEmpty!16887 (= (arr!11568 _values!549) ((as const (Array (_ BitVec 32) ValueCell!4745)) mapDefault!16887)))))

(declare-fun mapIsEmpty!16887 () Bool)

(assert (=> mapIsEmpty!16887 mapRes!16887))

(declare-fun b!403936 () Bool)

(assert (=> b!403936 (= e!243070 tp_is_empty!10177)))

(assert (= (and start!38744 res!232878) b!403932))

(assert (= (and b!403932 res!232876) b!403929))

(assert (= (and b!403929 res!232880) b!403926))

(assert (= (and b!403926 res!232881) b!403934))

(assert (= (and b!403934 res!232883) b!403927))

(assert (= (and b!403927 res!232875) b!403924))

(assert (= (and b!403924 res!232879) b!403928))

(assert (= (and b!403928 res!232877) b!403933))

(assert (= (and b!403933 res!232882) b!403931))

(assert (= (and b!403931 res!232884) b!403930))

(assert (= (and b!403935 condMapEmpty!16887) mapIsEmpty!16887))

(assert (= (and b!403935 (not condMapEmpty!16887)) mapNonEmpty!16887))

(get-info :version)

(assert (= (and mapNonEmpty!16887 ((_ is ValueCellFull!4745) mapValue!16887)) b!403936))

(assert (= (and b!403935 ((_ is ValueCellFull!4745) mapDefault!16887)) b!403925))

(assert (= start!38744 b!403935))

(declare-fun m!397221 () Bool)

(assert (=> b!403932 m!397221))

(declare-fun m!397223 () Bool)

(assert (=> b!403933 m!397223))

(declare-fun m!397225 () Bool)

(assert (=> b!403928 m!397225))

(declare-fun m!397227 () Bool)

(assert (=> mapNonEmpty!16887 m!397227))

(declare-fun m!397229 () Bool)

(assert (=> b!403934 m!397229))

(declare-fun m!397231 () Bool)

(assert (=> b!403930 m!397231))

(declare-fun m!397233 () Bool)

(assert (=> b!403926 m!397233))

(declare-fun m!397235 () Bool)

(assert (=> start!38744 m!397235))

(declare-fun m!397237 () Bool)

(assert (=> start!38744 m!397237))

(declare-fun m!397239 () Bool)

(assert (=> b!403924 m!397239))

(declare-fun m!397241 () Bool)

(assert (=> b!403931 m!397241))

(declare-fun m!397243 () Bool)

(assert (=> b!403931 m!397243))

(check-sat (not start!38744) (not b!403930) (not mapNonEmpty!16887) (not b!403933) (not b!403931) (not b!403934) (not b!403932) tp_is_empty!10177 (not b!403926) (not b!403924))
(check-sat)
