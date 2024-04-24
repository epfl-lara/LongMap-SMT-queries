; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!103020 () Bool)

(assert start!103020)

(declare-fun b!1236499 () Bool)

(declare-fun e!701228 () Bool)

(declare-fun e!701226 () Bool)

(assert (=> b!1236499 (= e!701228 (not e!701226))))

(declare-fun res!823871 () Bool)

(assert (=> b!1236499 (=> res!823871 e!701226)))

(declare-fun from!3213 () (_ BitVec 32))

(assert (=> b!1236499 (= res!823871 (bvslt (bvadd #b00000000000000000000000000000001 from!3213) #b00000000000000000000000000000000))))

(declare-datatypes ((List!27219 0))(
  ( (Nil!27216) (Cons!27215 (h!28433 (_ BitVec 64)) (t!40674 List!27219)) )
))
(declare-fun acc!846 () List!27219)

(declare-fun lt!560650 () List!27219)

(declare-fun subseq!528 (List!27219 List!27219) Bool)

(assert (=> b!1236499 (subseq!528 acc!846 lt!560650)))

(declare-datatypes ((Unit!40885 0))(
  ( (Unit!40886) )
))
(declare-fun lt!560647 () Unit!40885)

(declare-fun subseqTail!21 (List!27219 List!27219) Unit!40885)

(assert (=> b!1236499 (= lt!560647 (subseqTail!21 lt!560650 lt!560650))))

(assert (=> b!1236499 (subseq!528 lt!560650 lt!560650)))

(declare-fun lt!560651 () Unit!40885)

(declare-fun lemmaListSubSeqRefl!0 (List!27219) Unit!40885)

(assert (=> b!1236499 (= lt!560651 (lemmaListSubSeqRefl!0 lt!560650))))

(declare-datatypes ((array!79663 0))(
  ( (array!79664 (arr!38433 (Array (_ BitVec 32) (_ BitVec 64))) (size!38970 (_ BitVec 32))) )
))
(declare-fun a!3835 () array!79663)

(assert (=> b!1236499 (= lt!560650 (Cons!27215 (select (arr!38433 a!3835) from!3213) acc!846))))

(declare-fun b!1236500 () Bool)

(declare-fun res!823877 () Bool)

(assert (=> b!1236500 (=> res!823877 e!701226)))

(declare-fun contains!7290 (List!27219 (_ BitVec 64)) Bool)

(assert (=> b!1236500 (= res!823877 (contains!7290 lt!560650 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1236501 () Bool)

(declare-fun res!823870 () Bool)

(assert (=> b!1236501 (=> (not res!823870) (not e!701228))))

(assert (=> b!1236501 (= res!823870 (not (contains!7290 acc!846 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!823875 () Bool)

(assert (=> start!103020 (=> (not res!823875) (not e!701228))))

(assert (=> start!103020 (= res!823875 (and (bvslt (size!38970 a!3835) #b01111111111111111111111111111111) (bvsge from!3213 #b00000000000000000000000000000000) (bvslt from!3213 (size!38970 a!3835))))))

(assert (=> start!103020 e!701228))

(declare-fun array_inv!29371 (array!79663) Bool)

(assert (=> start!103020 (array_inv!29371 a!3835)))

(assert (=> start!103020 true))

(declare-fun b!1236502 () Bool)

(declare-fun res!823876 () Bool)

(assert (=> b!1236502 (=> (not res!823876) (not e!701228))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1236502 (= res!823876 (validKeyInArray!0 (select (arr!38433 a!3835) from!3213)))))

(declare-fun b!1236503 () Bool)

(declare-fun res!823873 () Bool)

(assert (=> b!1236503 (=> (not res!823873) (not e!701228))))

(assert (=> b!1236503 (= res!823873 (not (contains!7290 acc!846 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1236504 () Bool)

(assert (=> b!1236504 (= e!701226 true)))

(declare-fun lt!560649 () Bool)

(declare-fun arrayNoDuplicates!0 (array!79663 (_ BitVec 32) List!27219) Bool)

(assert (=> b!1236504 (= lt!560649 (arrayNoDuplicates!0 a!3835 (bvadd #b00000000000000000000000000000001 from!3213) lt!560650))))

(declare-fun lt!560648 () Unit!40885)

(declare-fun noDuplicateSubseq!75 (List!27219 List!27219) Unit!40885)

(assert (=> b!1236504 (= lt!560648 (noDuplicateSubseq!75 acc!846 lt!560650))))

(declare-fun b!1236505 () Bool)

(declare-fun res!823881 () Bool)

(assert (=> b!1236505 (=> (not res!823881) (not e!701228))))

(assert (=> b!1236505 (= res!823881 (not (= from!3213 (bvsub (size!38970 a!3835) #b00000000000000000000000000000001))))))

(declare-fun b!1236506 () Bool)

(declare-fun res!823879 () Bool)

(assert (=> b!1236506 (=> (not res!823879) (not e!701228))))

(declare-fun noDuplicate!1871 (List!27219) Bool)

(assert (=> b!1236506 (= res!823879 (noDuplicate!1871 acc!846))))

(declare-fun b!1236507 () Bool)

(declare-fun res!823878 () Bool)

(assert (=> b!1236507 (=> (not res!823878) (not e!701228))))

(assert (=> b!1236507 (= res!823878 (arrayNoDuplicates!0 a!3835 from!3213 acc!846))))

(declare-fun b!1236508 () Bool)

(declare-fun res!823872 () Bool)

(assert (=> b!1236508 (=> res!823872 e!701226)))

(assert (=> b!1236508 (= res!823872 (not (noDuplicate!1871 lt!560650)))))

(declare-fun b!1236509 () Bool)

(declare-fun res!823880 () Bool)

(assert (=> b!1236509 (=> (not res!823880) (not e!701228))))

(declare-fun k!2925 () (_ BitVec 64))

(assert (=> b!1236509 (= res!823880 (contains!7290 acc!846 k!2925))))

(declare-fun b!1236510 () Bool)

(declare-fun res!823874 () Bool)

(assert (=> b!1236510 (=> res!823874 e!701226)))

(assert (=> b!1236510 (= res!823874 (contains!7290 lt!560650 #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and start!103020 res!823875) b!1236506))

(assert (= (and b!1236506 res!823879) b!1236501))

(assert (= (and b!1236501 res!823870) b!1236503))

(assert (= (and b!1236503 res!823873) b!1236507))

(assert (= (and b!1236507 res!823878) b!1236509))

(assert (= (and b!1236509 res!823880) b!1236505))

(assert (= (and b!1236505 res!823881) b!1236502))

(assert (= (and b!1236502 res!823876) b!1236499))

(assert (= (and b!1236499 (not res!823871)) b!1236508))

(assert (= (and b!1236508 (not res!823872)) b!1236500))

(assert (= (and b!1236500 (not res!823877)) b!1236510))

(assert (= (and b!1236510 (not res!823874)) b!1236504))

(declare-fun m!1140717 () Bool)

(assert (=> b!1236507 m!1140717))

(declare-fun m!1140719 () Bool)

(assert (=> b!1236501 m!1140719))

(declare-fun m!1140721 () Bool)

(assert (=> b!1236508 m!1140721))

(declare-fun m!1140723 () Bool)

(assert (=> b!1236506 m!1140723))

(declare-fun m!1140725 () Bool)

(assert (=> b!1236504 m!1140725))

(declare-fun m!1140727 () Bool)

(assert (=> b!1236504 m!1140727))

(declare-fun m!1140729 () Bool)

(assert (=> b!1236502 m!1140729))

(assert (=> b!1236502 m!1140729))

(declare-fun m!1140731 () Bool)

(assert (=> b!1236502 m!1140731))

(declare-fun m!1140733 () Bool)

(assert (=> start!103020 m!1140733))

(declare-fun m!1140735 () Bool)

(assert (=> b!1236500 m!1140735))

(declare-fun m!1140737 () Bool)

(assert (=> b!1236503 m!1140737))

(declare-fun m!1140739 () Bool)

(assert (=> b!1236509 m!1140739))

(declare-fun m!1140741 () Bool)

(assert (=> b!1236499 m!1140741))

(declare-fun m!1140743 () Bool)

(assert (=> b!1236499 m!1140743))

(declare-fun m!1140745 () Bool)

(assert (=> b!1236499 m!1140745))

(declare-fun m!1140747 () Bool)

(assert (=> b!1236499 m!1140747))

(assert (=> b!1236499 m!1140729))

(declare-fun m!1140749 () Bool)

(assert (=> b!1236510 m!1140749))

(push 1)

(assert (not b!1236501))

(assert (not b!1236499))

(assert (not b!1236508))

(assert (not b!1236502))

(assert (not b!1236503))

(assert (not start!103020))

(assert (not b!1236506))

(assert (not b!1236509))

(assert (not b!1236500))

(assert (not b!1236507))

(assert (not b!1236504))

(assert (not b!1236510))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

